extends Node2D
const Character = preload("res://CubeBattle/Character.gd")

signal turn_ended
signal instants_triggered

var playerA setget setPlayerA
var playerB setget setPlayerB

func _ready():
	pass

func setPlayerA(value):
	playerA = value
	playerA.get_node('CubeSet').connect('cubes_rolled', self, 'resolveInstants', [playerA])
	playerA.connect('execution_solved', self, 'resolveCubes', [playerA])
	playerA.order = 1

func setPlayerB(value):
	playerB = value
	playerB.get_node('CubeSet').connect('cubes_rolled', self, 'resolveInstants', [playerB])
	playerB.connect('execution_solved', self, 'resolveCubes', [playerB])
	playerA.order = 2

func resolveInstants(faces, player):
	var oponent = playerB if player == playerA else playerA
	print('resolve instants for %s' % [player.order], faces)
	var instant_effects = []
	var i = 0
	for face in faces:
		var spell: Dictionary = $SpellChecker.values[face]

		if spell.has('instants'):
			for instant in spell.instants:
				instant_effects.append([i, instant])
		i += 1
	
	emit_signal('instants_triggered', instant_effects, player)


func resolveCubes(values, player):
	var oponent = playerB if player == playerA else playerA
	$SpellChecker.find_combos(values)
	emit_signal("turn_ended", oponent.order)

