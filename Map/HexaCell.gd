tool
extends Node2D

signal mouse_entered
signal mouse_exited

export (Vector3) var coordinates = Vector3(0.0, 0.0, 0.0)

var inversal_coords = Vector3(0.0, 0.0, 0.0)

var neighbor_hover = false setget set_neighbor_hover

var neighbors = []

# sprite width
var width = 134

# y value on the vector pointing from 0,0,0 to 0,-1,1
var height_distance = 82 + 2

func _ready():
	$Area2D.connect('input_event', self, 'on_input')
	$Area2D.connect("mouse_entered", self, "on_hover")
	$Area2D.connect("mouse_exited", self, "on_exit")


func get_coordinates_by_position():
	var coord_x = -1.0
	var coord_y = -1.0
	var coord_z = -1.0
	coord_x = position.x/width - position.y/(2*height_distance)
	coord_y = position.y/height_distance
	coord_z = -coord_x-coord_y
	inversal_coords = Vector3(coord_x, coord_z, coord_y)
	coordinates = inversal_coords
	set_neighbor_coordinates()
	$DebugInversal.text = '%s %s %s ' % [inversal_coords.x, inversal_coords.y, inversal_coords.z]

func set_neighbor_coordinates():
	neighbors = [
		hash(Vector3(coordinates.x + 1, coordinates.y + 0, coordinates.z - 1)),
		hash(Vector3(coordinates.x + 1, coordinates.y - 1, coordinates.z + 0)),
		hash(Vector3(coordinates.x + 0, coordinates.y - 1, coordinates.z + 1)),
		hash(Vector3(coordinates.x - 1, coordinates.y + 0, coordinates.z + 1)),
		hash(Vector3(coordinates.x - 1, coordinates.y + 1, coordinates.z + 0)),
		hash(Vector3(coordinates.x + 0, coordinates.y + 1, coordinates.z - 1))
	]


func get_hash():
	return hash(coordinates)


func on_hover():
	#z_index = 25
	yield(get_tree().create_timer(0.01), 'timeout')
	emit_signal("mouse_entered")
	


func on_exit():
	#z_index = 0
	emit_signal("mouse_exited")

	
func set_neighbor_hover(value):
	neighbor_hover = value


func on_input(_node, _event, _shape):
	if _event is InputEventMouseButton and _event.pressed:
		pass

