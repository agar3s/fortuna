extends Node2D


var cube_debug_text = "Face: \t%s\nKeep: \t%s\nLocked: \t%s"

func _ready():
	randomize()
	$Button.connect("button_down", self, "roll_dice")
	$Cube.connect('on_lock', self, 'update_debug')
	$Cube.connect("on_keep", self, 'update_debug')
	update_debug('init')

func roll_dice():
	$Cube.roll()
	update_debug('alo')

func update_debug(value):
	print(value)
	$DebugCube1.text = cube_debug_text % [$Cube.face_up, $Cube.keeped, $Cube.locked]
	
func test_signal():
	print('test signal')
