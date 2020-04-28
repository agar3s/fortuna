extends Node


func apply_damage(damage, type, from, to):
	if from != to:
		from.cast(type)
	to.get_damage(damage, type)


func parse_spell(spell, player, enemy, cube_index):
	var from = player
	var to = enemy
	if spell.has('to') and spell.to == 'player':
		to = player
		
	if spell.type=='apply_damage':
		apply_damage(spell.damage, spell.damage_type, from, to)
	
