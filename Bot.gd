extends Node
const Character = preload("res://Arena/Character.gd")
const CubeSet = preload("res://Cubes/CubeSet.gd")

var player: Character
var cubeset: CubeSet

var strategy = 'random'
var skip_cast = false
export var enabled = true

func _ready():
	if !enabled: return
	player = get_parent()
	if player is Character:
		player.connect("active_changed", self, 'check_turn')
		cubeset = player.get_node('CubeSet')
		cubeset.connect('cubes_rolled', self, 'on_cubes_rolled')
		

func check_turn(active):
	if not active: return
	skip_cast = false
	yield(get_tree().create_timer(0.5), "timeout")
	player.roll()

func roll():
	player.roll()

func on_cubes_rolled(_faces):
	skip_cast = false
	for face in _faces:
		skip_cast = skip_cast or '05' == face[0]

	skip_cast = skip_cast and (cubeset.roll_count + 1) != cubeset.roll_limit

	if skip_cast: 
		return
	yield(get_tree().create_timer(0.5), "timeout")
	
		
	player.send_cast()

