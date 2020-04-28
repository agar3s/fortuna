extends Node2D

var cube_debug_text = "Faces: %s %s %s\nRoll Count: %s\nCan roll?: %s\nCombo: %s"
var computed_values = ''
func _ready():
	$Roll.connect("button_down", self, 'roll_cubes')
	$Reset.connect("button_down", self, 'reset_cubes')
	$Execute.connect("button_down", self, 'execute_cubes')
	$CubeSet.connect("on_execute", self, 'execute_result')
	$CubeSet.connect("cubes_rolled", self, 'update_rolls')
	$BattleEngine.connect('instants_triggered', self, 'display_instants')

	
	$Cube01.connect("item_selected", self, 'load_dice', [$CubeSet/Cubes/Cube1])
	$Cube02.connect("item_selected", self, 'load_dice', [$CubeSet/Cubes/Cube2])
	$Cube03.connect("item_selected", self, 'load_dice', [$CubeSet/Cubes/Cube3])
	
	$CubeSet/Cubes/Cube1.connect("on_keep", self, 'update_face')
	$CubeSet/Cubes/Cube2.connect("on_keep", self, 'update_face')
	$CubeSet/Cubes/Cube3.connect("on_keep", self, 'update_face')
	$CubeSet/Cubes/Cube1.connect("on_lock", self, 'update_face')
	$CubeSet/Cubes/Cube2.connect("on_lock", self, 'update_face')
	$CubeSet/Cubes/Cube3.connect("on_lock", self, 'update_face')
	
	
	
	for key in CubeConfigurations.cubes.keys():
		$Cube01.add_item(key)
		$Cube02.add_item(key)
		$Cube03.add_item(key)
	

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
	update_probabilities()
	# check instants?
	print('update rolls from subset', values)
	$BattleEngine.resolveInstants(values, {'order': 1})


func update_debug_text():
	$DebugSet2.text = cube_debug_text % [
		$CubeSet/Cubes/Cube1.face_up,
		$CubeSet/Cubes/Cube2.face_up,
		$CubeSet/Cubes/Cube3.face_up,
		$CubeSet.roll_count,
		$CubeSet.can_roll(),
		str(computed_values)
	]

func display_instants(instants, player):
	print('should execute instants from %s' % [player.order])
	print(instants)

func execute_result(combo):
	computed_values = $BattleEngine.get_node("SpellChecker").find_combos(combo)
	print(computed_values)


func load_dice(index, cube):
	print(cube, index)
	var key = $Cube01.get_item_text(index)
	cube.id = key
	update_probabilities()


func update_face(value):
	update_probabilities()


class MyCustomSorter:
	static func sort_ascending(a, b):
		return a.prob < b.prob


func update_probabilities():
	var availableFaces: Array= $CubeSet.get_available_faces()
	var combinations = $BattleEngine.get_node('SpellChecker').find_probabilities(availableFaces[0], availableFaces[1], availableFaces[2])
	$DebugSet1.text = ''
	var keys = combinations.keys()
	var combos = []
	
	for key in keys:
		var combo = combinations[key]
		combo.id = key
		combos.append(combo)
	
	combos.sort_custom(MyCustomSorter, 'sort_ascending')
	
	for combo in combos:
		#if not combo.triple: continue
		$DebugSet1.text += '\n%s\t\t\t=%s\t%s' % [combo.id, combo.total, combo.prob]

