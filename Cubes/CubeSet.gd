tool
extends Node2D

signal on_cast
signal cast_unlocked
signal cubes_rolled
signal max_roll_reached

export (Array, String) var cube_indexes = ['001', '001', '001'] setget set_cube_indexes

var roll_count = 0
var roll_limit = 3 setget set_roll_limit
const roll_default_value = 3
var locked = false setget set_locked

var cubes_done = 0
var cubes_thrown = 0
var new_faces = []

func _ready():
	var i = 0
	for child in $Cubes.get_children():
		child.id = cube_indexes[i]
		child.index = i
		child.connect('cube_rolled', self, 'propagate_instant_effect')
		i += 1


func set_cube_indexes(values):
	cube_indexes = values
	var i = 0
	for child in $Cubes.get_children():
		child.id = cube_indexes[i]
		i += 1

	
func propagate_instant_effect(face, cube_index):
	cubes_done += 1
	new_faces.append([face, cube_index])
	if cubes_done == cubes_thrown:
		cubes_rolled()


func cubes_rolled():
	emit_signal('cubes_rolled', new_faces)
	
	roll_count += 1
	if roll_count == 1:
		emit_signal('cast_unlocked')
	# autocast off
	if roll_count >= roll_limit:
		emit_signal('max_roll_reached')
		# lock dices
		for cube in $Cubes.get_children():
			cube.locked = true
	#	cast()


func roll_cubes():
	if not can_roll(): return
	cubes_done = 0
	cubes_thrown = 0
	new_faces = []
	
	for cube in $Cubes.get_children():
		if cube.can_roll():
			cubes_thrown += 1
		cube.roll()


func can_roll():
	return !locked and roll_count < roll_limit


func reset():
	roll_count = 0
	roll_limit = roll_default_value
	locked = false
	for child in $Cubes.get_children():
		child.reset()


func get_combo():
	var combo = []
	for cube in $Cubes.get_children():
		combo.append(cube.get_face_value())
	return combo


func cast():
	if locked || roll_count == 0: return
	locked = true
	emit_signal('on_cast', get_combo())


func get_available_faces():
	var faces = []
	for cube in $Cubes.get_children():
		if cube.can_roll():
			faces.append(cube.face_indexes)
		else:
			faces.append([cube.get_face_value()])
	return faces


func set_roll_limit(value):
	roll_limit = value
	if roll_limit < 1:
		roll_limit = 1

func set_locked(_locked):
	locked = _locked
	if locked:
		for cube in $Cubes.get_children():
			cube.hide_cube();


func force_result(faces):
	print('force results ', faces)
	var _index = 0
	for cube in $Cubes.get_children():
		cube.force_next_result(faces[_index])
		_index += 1
	
		
		
		
		
