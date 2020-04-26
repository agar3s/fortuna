extends Node2D


func _ready():
	$Button.connect("button_down", self, 'roll_cubes')

func roll_cubes():
	$CubeSet.roll_cubes()
