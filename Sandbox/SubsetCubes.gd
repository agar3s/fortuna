extends Node2D

var cube_debug_text = "Faces: %s %s %s\nRoll Count: %s\nCan roll?: %s\nCombo: %s"
var computed_values = ''
func _ready():
	$Roll.connect("button_down", self, 'roll_cubes')
	$Reset.connect("button_down", self, 'reset_cubes')
	$Execute.connect("button_down", self, 'execute_cubes')
	$CubeSet.connect("on_execute", self, 'execute_result')
	$CubeSet.connect("cubes_rolled", self, 'update_rolls')

func roll_cubes():
	$CubeSet.roll_cubes()
	update_debug_text()

func reset_cubes():
	$CubeSet.reset()
	update_debug_text()

func execute_cubes():
	$CubeSet.execute()
	update_debug_text()

func update_rolls(values):
	update_debug_text()

func update_debug_text():
	$DebugSet1.text = cube_debug_text % [
		$CubeSet/Cubes/Cube1.face_up,
		$CubeSet/Cubes/Cube2.face_up,
		$CubeSet/Cubes/Cube3.face_up,
		$CubeSet.roll_count,
		$CubeSet.can_roll(),
		str(computed_values)
	]

func execute_result(combo):
	computed_values = $BattleEngine.resolveCubes('origin', 'target', combo)
	print(computed_values)
	
