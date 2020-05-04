extends Node
const Character = preload("res://Arena/Character.gd")
const CubeSet = preload("res://Cubes/CubeSet.gd")

var player: Character
var cubeset: CubeSet

var strategy = 'random'

func _ready():
	player = get_parent()
	if player is Character:
		player.connect("active_changed", self, 'check_turn')
		cubeset = player.get_node('CubeSet')
		print('BOT: loading cubeset')
		print(cubeset)
		cubeset.connect('cubes_rolled', self, 'on_cubes_rolled')
		cubeset.connect('cast_unlocked', self, 'on_cast_unlocked')

func check_turn(active):
	if not active: return
	yield(get_tree().create_timer(0.5), "timeout")
	player.roll()

func roll():
	print('BOT: perform a roll')
	player.roll()

func on_cubes_rolled(_faces):
	print('BOT: cubes rolled')
	print(_faces)

func on_cast_unlocked():
	print('BOT: I can do a cast')
	yield(get_tree().create_timer(0.5), "timeout")
	
	player.send_cast()
