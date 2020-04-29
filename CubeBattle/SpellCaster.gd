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
	
	from.demon_tokens -= quantity
	to.demon_tokens += quantity


func prevent_damage(damage, to):
	to.armor += damage

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
	
	if spell.type == 'lock_dice':
		lock_dice(spell.target, from, cube_index)
	
	if spell.type == 'unlock_dice':
		unlock_dice(spell.target, from, cube_index)
	
	if spell.type == 'roll':
		roll(spell.target, from)
	
