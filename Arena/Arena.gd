extends Node2D

var active_player

func _ready():
	$BattleEngine.player_a = $Player1
	$Player1/CubeSet.global_position = $CubeSection/CubesetPosition.global_position
	
	$BattleEngine.player_b = $Player2
	$Player2/CubeSet.global_position = $CubeSection/CubesetPosition.global_position
	
	$BattleEngine.demon_pool = $DemonPool
	
	$CubeSection/Cast.connect("button_down", self, 'send_cast')
	$CubeSection/Reroll.connect("button_down", self, 'roll')
	
	$BattleEngine.connect('turn_ended', self, 'on_player_turn_end')
	$BattleEngine.connect('battle_over', self, 'on_battle_ends')
	on_player_turn_end(2)


func on_player_turn_end(player):
	var turn_a = player != 1
	$Player1.active = turn_a
	$Player2.active = not turn_a
	$Player1/CubeSet.visible = turn_a
	$Player2/CubeSet.visible = not turn_a

	if turn_a:
		active_player = $Player1
	else:
		active_player = $Player2

func send_cast():
	active_player.send_cast()

func roll():
	active_player.roll()
	
func on_battle_ends(winner):
	print(winner.name, " wins")
	$CubeSection.hide()
