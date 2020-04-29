extends Node


func apply_damage(damage, type, from, to):
	if from != to:
		from.cast(type)
	to.get_damage(damage, type)


func recover_damage(hit_points, to):
	to.recover_damage(hit_points)
	

func transfer_demon_counter(quantity, from, to):
	if quantity is String and quantity == 'all':
		quantity = from.demon_tokens
	
	quantity = quantity if from.demon_tokens >= quantity else from.demon_tokens
	
	if to.demon_armor > 0:
		var res = quantity - to.demon_armor
		if res < 0:
			# blocked quantity demon counters
			to.demon_armor -= quantity
			quantity = 0
		else:
			# blocked to.demon_armor demon counters
			quantity = res
			to.demon_armor = 0
	
	from.demon_tokens -= quantity
	to.demon_tokens += quantity


func prevent_damage(damage, to):
	to.armor += damage

func prevent_demon_counter(quantity, to):
	to.demon_armor += quantity

func lock_dice(target, from, cube_index):
	var lock_candidates = []
	if target == 'self':
		lock_candidates = [cube_index]
	if target == 'all':
		lock_candidates = [0, 1, 2]

	from.lock_cubes(lock_candidates)


func unlock_dice(target, from, cube_index):
	var unlock_candidates = []
	if target == 'self':
		unlock_candidates = [cube_index]
	if target == 'all':
		unlock_candidates = [0, 1, 2]

	from.force_unlock_cubes(unlock_candidates)

func roll(target, from):
	if target == 'player':
		Events.emit_signal('roll_scheduled', from)


func apply_damage_state(damage, type, turns, from, to):
	if from != to:
		from.cast(type)
	# when target to add state is to=> himself is generating damage
	to.add_state([{
		'type': 'apply_damage',
		'damage': damage,
		'damage_type': type,
		'from': 'player',
		'to': 'player'
	}], turns, 'curse')


func recover_damage_state(hit_points, turns, from, to):
	from.add_state([{
		'type': 'recover_damage',
		'hit_points': hit_points,
		'to': 'player'
	}], turns, 'defense')


func drain_damage_state(damage, type, turns, from, to):
	if from != to:
		from.cast(type)
	# when target to add state is to=> himself is generating damage, enemy is from and to is player
	to.add_state([{
		'type': 'apply_damage',
		'damage': damage,
		'damage_type': type,
		'from': 'player',
		'to': 'player'
	}, {
		'type': 'recover_damage',
		'hit_points': damage,
		'from': 'enemy',
		'to': 'enemy'
	}], turns, 'curse')


func parse_spell(spell, player, enemy, cube_index, demon_pool):
	var from = player
	var to = enemy
	print('parsing spell> ', spell.type)
	if spell.has('to') and spell.to == 'player':
		to = player
		
	if spell.type == 'apply_damage':
		apply_damage(spell.damage, spell.damage_type, from, to)

	if spell.type == 'recover_damage':
		recover_damage(spell.hit_points, to)

	if spell.type == 'transfer_demon_counter':
		if spell.from == 'pool':
			from = demon_pool
		if spell.to == 'pool':
			to = demon_pool
		transfer_demon_counter(spell.quantity, from, to)

	if spell.type == 'prevent_damage':
		prevent_damage(spell.damage, to)
	
	if spell.type == 'prevent_demon_counter':
		prevent_demon_counter(spell.quantity, from)
	
	if spell.type == 'lock_dice':
		lock_dice(spell.target, from, cube_index)
	
	if spell.type == 'unlock_dice':
		unlock_dice(spell.target, from, cube_index)
	
	if spell.type == 'roll':
		roll(spell.target, from)
	
	if spell.type == 'apply_continuous_damage':
		apply_damage_state(spell.damage, spell.damage_type, spell.turns, from, to)

	if spell.type == 'recover_continuous_damage':
		recover_damage_state(spell.hit_points, spell.turns, from, to)
	
	if spell.type == 'apply_continuous_drain_damage':
		drain_damage_state(spell.damage, spell.damage_type, spell.turns, from, to)
