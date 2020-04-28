extends Node


func apply_damage(damage, type, from, to):
	if from != to:
		from.cast(type)
	to.get_damage(damage, type)


func recover_damage(hit_points, to):
	to.recover_damage(hit_points)


func parse_spell(spell, player, enemy, cube_index):
	var from = player
	var to = enemy
	if spell.has('to') and spell.to == 'player':
		to = player
		
	if spell.type == 'apply_damage':
		apply_damage(spell.damage, spell.damage_type, from, to)

	if spell.type == 'recover_damage':
		recover_damage(spell.hit_points, to)
