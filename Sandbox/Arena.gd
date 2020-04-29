extends Node2D



func _ready():
	$BattleEngine.player_a = $PlayerA
	$BattleEngine.player_b = $PlayerB
	$BattleEngine.demon_pool = $DemonPool

	$RollA.connect("button_down", $PlayerA, 'roll')
	$ExecuteA.connect("button_down", $PlayerA, 'send_cast')

	$RollB.connect("button_down", $PlayerB, 'roll')
	$ExecuteB.connect("button_down", $PlayerB, 'send_cast')
	$PlayerB/Body.flip_h = true
	
	$BattleEngine.connect('turn_ended', self, 'on_player_turn_end')
	on_player_turn_end(2)
	
	$LoadDices.connect('button_down', self, 'load_dices')
	
	$Reset.connect('button_down', self, 'reset_game')



func on_player_turn_end(player):
	var turn_a = player != 1
	$RollA.disabled = !turn_a
	$ExecuteA.disabled = !turn_a
	$PlayerA.active = turn_a
	
	$RollB.disabled = turn_a
	$ExecuteB.disabled = turn_a
	$PlayerB.active = !turn_a

func load_dices():
	$PlayerA/CubeSet/Cubes/Cube1.id = $TextEdit1.text.to_upper()
	$PlayerA/CubeSet/Cubes/Cube2.id = $TextEdit2.text.to_upper()
	$PlayerA/CubeSet/Cubes/Cube3.id = $TextEdit3.text.to_upper()
	$PlayerB/CubeSet/Cubes/Cube1.id = $TextEdit4.text.to_upper()
	$PlayerB/CubeSet/Cubes/Cube2.id = $TextEdit5.text.to_upper()
	$PlayerB/CubeSet/Cubes/Cube3.id = $TextEdit6.text.to_upper()
	
func reset_game():
	$PlayerA.hit_points = 12
	$PlayerA.demon_armor = 0
	$PlayerA.demon_tokens = 0
	$PlayerA.armor = 0
	for state in $PlayerA/States.get_children():
		state.queue_free()
	
	$PlayerB.hit_points = 12
	$PlayerB.demon_armor = 0
	$PlayerB.demon_tokens = 0
	$PlayerB.armor = 0
	for state in $PlayerB/States.get_children():
		state.queue_free()
		
	$DemonPool.demon_tokens = 0
