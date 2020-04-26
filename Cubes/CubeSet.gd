extends Node2D

export (Array, int) var cube_indexes = [0, 1, 2]

var roll_count = 0
var roll_limit = 3

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

func can_roll():
	return roll_count < roll_limit

func reset():
	roll_count = 0

