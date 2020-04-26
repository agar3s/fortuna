extends Node2D


var cube_debug_text = "Face: %s"

func _ready():
	randomize()
	$Button.connect("button_down", self, "roll_dice")

func roll_dice():
	$Cube.roll()
	$DebugCube1.text = cube_debug_text % [$Cube.face_up]
	
