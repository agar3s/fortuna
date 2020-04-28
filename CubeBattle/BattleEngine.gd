extends Node
const Character = preload("res://CubeBattle/Character.gd")

signal turn_ended
signal instants_triggered

var player_a setget set_player_a
var player_b setget set_player_b

func _ready():
	pass

func set_player_a(value):
	player_a = value
	player_a.get_node('CubeSet').connect('cubes_rolled', self, 'solve_instants', [player_a])
	player_a.connect('execution_solved', self, 'solve_execution', [player_a])
	player_a.order = 1

func set_player_b(value):
	player_b = value
	player_b.get_node('CubeSet').connect('cubes_rolled', self, 'solve_instants', [player_b])
	player_b.connect('execution_solved', self, 'solve_execution', [player_b])
	player_a.order = 2

func solve_instants(faces, player):
	var oponent = player_b if player == player_a else player_a
	print('resolve instants for %s' % [player.order], faces)
	var instant_effects = []
	var i = 0
	for face in faces:
		var spell: Dictionary = $SpellChecker.values[face]

		if spell.has('instants'):
			for instant in spell.instants:
				instant_effects.append([i, instant])
				apply_spell(instant, player, oponent, i)
		i += 1
	
	emit_signal('instants_triggered', instant_effects, player)


func solve_execution(values, player):
	var oponent = player_b if player == player_a else player_a
	$SpellChecker.find_combos(values)

	# curses apply first
	for value in values:
		for spell in $SpellChecker.values[value].effects:
			apply_spell(spell, player, oponent)

	emit_signal("turn_ended", oponent.order)


func apply_spell(spell, from, to, cube_index=-1):
	print('do something ', spell.type)
	$SpellCaster.parse_spell(spell, from, to, cube_index)





