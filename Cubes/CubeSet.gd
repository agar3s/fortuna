extends Node2D

export (Array, int) var cube_indexes = [0, 1, 2]


func _ready():
	var i = 0
	for child in $Cubes.get_children():
		child.id = cube_indexes[i]
		i += 1

func roll_cubes():
	for cube in $Cubes.get_children():
		cube.roll()
	
