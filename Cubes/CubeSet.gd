extends Node2D

signal on_execute
signal execute_unlocked
signal cubes_rolled

export (Array, String) var cube_indexes = ['001', '001', '001']

var roll_count = 0
var roll_limit = 3
var locked = false

var cubes_done = 0
var cubes_thrown = 0
var new_faces = []

func _ready():
	var i = 0
	for child in $Cubes.get_children():
		child.id = cube_indexes[i]
		child.connect('cube_rolled', self, 'propagate_instant_effect')
		i += 1

func propagate_instant_effect(face):
	cubes_done += 1
	new_faces.append(face)
	if cubes_done == cubes_thrown:
		emit_signal('cubes_rolled', new_faces)


func roll_cubes():
	if not can_roll(): return
	cubes_done = 0
	cubes_thrown = 0
	new_faces = []
	
	for cube in $Cubes.get_children():
		if cube.can_roll():
			cubes_thrown += 1
		cube.roll()
	
	roll_count += 1
	if roll_count == 1:
		emit_signal("execute_unlocked")
	if roll_count >= roll_limit:
		execute()


func can_roll():
	return !locked and roll_count < roll_limit


func reset():
	roll_count = 0
	locked = false
	for child in $Cubes.get_children():
		child.reset()

func get_combo():
	var combo = []
	for cube in $Cubes.get_children():
		combo.append(cube.get_face_value())
	return combo


func execute():
	if locked || roll_count == 0: return
	locked = true
	emit_signal('on_execute', get_combo())
	
