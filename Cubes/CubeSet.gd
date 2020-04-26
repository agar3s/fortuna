extends Node2D

signal on_execute

export (Array, int) var cube_indexes = [0, 1, 2]

var roll_count = 0
var roll_limit = 3
var locked = false

func _ready():
	var i = 0
	for child in $Cubes.get_children():
		child.id = cube_indexes[i]
		i += 1


func roll_cubes():
	if not can_roll(): return
	
	for cube in $Cubes.get_children():
		cube.roll()
	
	roll_count += 1
	if roll_count >= roll_limit:
		execute()


func can_roll():
	return !locked and roll_count < roll_limit


func reset():
	roll_count = 0
	locked = false


func get_combo():
	var combo = []
	for cube in $Cubes.get_children():
		combo.append(cube.get_face_value())
	return combo


func execute():
	if locked: return
	locked = true
	emit_signal('on_execute', get_combo())
	
