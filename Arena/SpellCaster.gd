extends Node

func apply_damage(damage, type, from, to):
	if from != to:
		from.cast(type)
	to.get_damage(damage, type)
	print('to apply damage')
	yield(to, 'damage_applied')
	print('after damage applied')
	Events.emit_signal('spell_casted')
	


func recover_damage(hit_points, to):
	to.recover_damage(hit_points)
	yield(to, 'healed')
	Events.emit_signal('spell_casted')
	

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
		to.emit_signal('demon_armor_updated', to.demon_armor)
	
	from.demon_tokens -= quantity
	to.demon_tokens += quantity
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')


func prevent_damage(damage, to):
	to.armor += damage
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')

func prevent_demon_counter(quantity, to):
	to.demon_armor += quantity
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')

func remove_state(quantity, type, to):
	if quantity is String and quantity == 'all':
		quantity = 100
	to.remove_states(quantity, type)
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')

func lock_dice(target, from, cube_index):
	var lock_candidates = []
	if target == 'self':
		lock_candidates = [cube_index]
	if target == 'all':
		lock_candidates = [0, 1, 2]

	from.lock_cubes(lock_candidates)
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')


func unlock_dice(target, from, cube_index):
	var unlock_candidates = []
	if target == 'self':
		unlock_candidates = [cube_index]
	if target == 'all':
		unlock_candidates = [0, 1, 2]

	from.force_unlock_cubes(unlock_candidates)
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')

func roll(target, from):
	if target == 'player':
		Events.emit_signal('roll_scheduled', from)
	
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")	
	Events.emit_signal('spell_casted')


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
	}], turns, 'curse', type)
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')


func recover_damage_state(hit_points, turns, from, _to):
	from.add_state([{
		'type': 'recover_damage',
		'hit_points': hit_points,
		'to': 'player'
	}], turns, 'defense', 'heal')
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')


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
	}], turns, 'curse', 'vampire')
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')


func set_roll_limit_state(value, turns, to):
	var state_type = 'curse' if value < 0 else 'defense'
	var icon_type = 'decrease_speed' if value < 0 else 'increase_speed'
	to.add_state([{
		'type': 'set_roll_limit',
		'value': value,
		'from': 'player',
		'to': 'player'
	}], turns, state_type, icon_type)
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')


func set_roll_limit(value, to):
	to.add_roll_limit(value)
	#TODO implement this
	yield(get_tree().create_timer(0.2),"timeout")
	Events.emit_signal('spell_casted')


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
	
	if spell.type == 'remove_state':
		remove_state(spell.quantity, spell.state_type, to)
	
	if spell.type == 'apply_continuous_damage':
		apply_damage_state(spell.damage, spell.damage_type, spell.turns, from, to)

	if spell.type == 'recover_continuous_damage':
		recover_damage_state(spell.hit_points, spell.turns, from, to)
	
	if spell.type == 'apply_continuous_drain_damage':
		drain_damage_state(spell.damage, spell.damage_type, spell.turns, from, to)

	if spell.type == 'modify_roll_limit_state':
		set_roll_limit_state(spell.value, spell.turns, to)

	if spell.type == 'set_roll_limit':
		set_roll_limit(spell.value, to)
