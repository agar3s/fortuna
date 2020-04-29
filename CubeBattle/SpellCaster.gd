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
