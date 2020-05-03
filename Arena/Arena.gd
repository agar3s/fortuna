extends Node2D

var active_player

func _ready():
	randomize()
	$BattleEngine.player_a = $Player1
	$Player1/CubeSet.global_position = $CubeSection/CubesetPosition.global_position
	$Player1/CubeSet.connect("cast_unlocked", $CubeSection/Cast, 'set_disabled', [false])
	$Player1/CubeSet.connect("max_roll_reached", $CubeSection/Roll, 'set_disabled', [true])
	
	$AvatarPlayer1.character = $Player1
	$Player1/States.global_position = $AvatarPlayer1/StatsAnchor.global_position
	$AvatarPlayer2.character = $Player2
	$Player2/States.global_position = $AvatarPlayer2/StatsAnchor.global_position
	

	$BattleEngine.player_b = $Player2
	$Player2/CubeSet.global_position = $CubeSection/CubesetPosition.global_position
	$Player2/CubeSet.connect("cast_unlocked", $CubeSection/Cast, 'set_disabled', [false])
	$Player2/CubeSet.connect("max_roll_reached", $CubeSection/Roll, 'set_disabled', [true])
	
	$BattleEngine.demon_pool = $DemonPool
	
	$CubeSection/Cast.connect("button_down", self, 'send_cast')
	$CubeSection/Roll.connect("button_down", self, 'roll')
	
	$BattleEngine.connect('turn_ended', self, 'on_player_turn_ends')
	$BattleEngine.connect('battle_over', self, 'on_battle_ends')
	on_player_turn_ends(2)


func on_player_turn_ends(player):
	var prev_player = $Player1 if player == 1 else $Player2
	active_player = $Player1 if player != 1 else $Player2
	
	prev_player.active = false
	prev_player.get_node('CubeSet').hide()

	$HUD/Message.show_message("%s's turn" % active_player.character_name)
	yield($HUD/Message, 'message_ended')
	active_player.active = true
	active_player.get_node('CubeSet').show()
	
	$CubeSection/Cast.set_disabled(true)
	$CubeSection/Roll.set_disabled(false)


func send_cast():
	$CubeSection/Cast.set_disabled(true)
	$CubeSection/Roll.set_disabled(true)
	active_player.send_cast()

func roll():
	active_player.roll()
	
func on_battle_ends(winner):
	$CubeSection.hide()
	$HUD/Message.show_message("%s's won" % winner.character_name, 3.0)
	yield($HUD/Message, 'message_ended')
