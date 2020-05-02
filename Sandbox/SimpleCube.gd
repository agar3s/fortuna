extends Node2D


var cube_debug_text = "Face: \t%s\nKeep: \t%s\nLocked: \t%s"

func _ready():
	randomize()
	$Button.connect("button_down", self, "roll_dice")
	$Cube.connect('on_lock', self, 'update_debug')
	$Cube.connect("on_keep", self, 'update_debug')
	$Cube.connect("cube_rolled", self, 'cube_rolled')
	$ItemList.connect("item_selected", self, 'load_dice')
	update_debug('init')
	for key in CubeConfigurations.cubes.keys():
		$ItemList.add_item(key)
	
	load_dice(0)


func roll_dice():
	$Cube.roll()
	update_debug('alo')

func cube_rolled(value, _value):
	update_debug(value)

func update_debug(value):
	print(value)
	$DebugCube1.text = cube_debug_text % [$Cube.face_up, $Cube.keeped, $Cube.locked]
	
func test_signal():
	print('test signal')

func load_dice(index):
	var key = $ItemList.get_item_text(index)
	print(key)
	$Cube.id = key

	for child in $faces.get_children():
		$faces.remove_child(child)

	var i = 0
	for child in $Cube/Faces.get_children():
		var copy = child.duplicate()
		copy.show()
		copy.position.x += i*42
		$faces.add_child(copy)
		i+=1
