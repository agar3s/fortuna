extends Node2D
const Character = preload("res://CubeBattle/Character.gd")

signal turn_ended

var playerA setget setPlayerA
var playerB setget setPlayerB

func _ready():
	pass

func setPlayerA(value):
	playerA = value
	playerA.get_node('CubeSet').connect('cubes_rolled', self, 'resolveInstantsFromA')
	playerA.connect('execution_solved', self, 'resolveCubesFromA')
	

func setPlayerB(value):
	playerB = value
	playerB.get_node('CubeSet').connect('cubes_rolled', self, 'resolveInstantsFromB')
	playerB.connect('execution_solved', self, 'resolveCubesFromB')

func resolveInstantsFromA(cubes):
	print('resolve instants for A ', cubes)

func resolveInstantsFromB(cubes):
	print('resolve instants for B ', cubes)
	print('resolve instants for B ', cubes)
	
func resolveCubesFromA(cubes):
	resolveCubes(playerA, playerB, cubes)
	emit_signal("turn_ended", 1)

func resolveCubesFromB(cubes):
	resolveCubes(playerB, playerA, cubes)
	emit_signal("turn_ended", 2)

func resolveCubes(origin, target, values: Array):
	return $SpellChecker.find_combos(values)
