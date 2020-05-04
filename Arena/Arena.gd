extends Node2D

var active_player
var triggers = []
export (bool) var display_dialogue = true
export (String) var dialogue_script = 'level01'
var status = 'waiting'

func _ready():
	randomize()
	$BattleEngine.player_a = $Player1
	$Player1/CubeSet.global_position = $CubeSection/CubesetPosition.global_position
	$Player1/CubeSet.connect("cast_unlocked", $CubeSection/Cast, 'set_disabled', [false])
	$Player1/CubeSet.connect("max_roll_reached", $CubeSection/Roll, 'set_disabled', [true])
	
	$AvatarPlayer1.character = $Player1
	$Player1/States.global_position = $AvatarPlayer1/StatsAnchor.global_position
	
	

	$BattleEngine.player_b = $Player2
	$Player2/CubeSet.global_position = $CubeSection/CubesetPosition.global_position
	$Player2/CubeSet.connect("cast_unlocked", $CubeSection/Cast, 'set_disabled', [false])
	$Player2/CubeSet.connect("max_roll_reached", $CubeSection/Roll, 'set_disabled', [true])
	$AvatarPlayer2.character = $Player2
	$Player2/States.global_position = $AvatarPlayer2/StatsAnchor.global_position
	
	$BattleEngine.demon_pool = $DemonPool
	
	$CubeSection/Cast.connect("button_down", self, 'send_cast')
	$CubeSection/Roll.connect("button_down", self, 'roll')
	
	$BattleEngine.connect('turn_ended', self, 'on_player_turn_ends')
	$BattleEngine.connect('battle_over', self, 'on_battle_ends')
	
	display_ui(false)
	if display_dialogue:
		NarrativeScript.run_script(dialogue_script, 'begin')
		yield(Events, "dialogue_script_ended")
	start_battle()


func display_ui(display: bool):
	$CubeSection.visible = display
	$Player1/CubeSet.visible = display
	$Player1/States.visible = display
	$Player2/CubeSet.visible = display
	$Player2/States.visible = display
	$AvatarPlayer1.visible = display
	$AvatarPlayer2.visible = display
	$DemonPool.visible = display
	

func start_battle():
	display_ui(true)
	$Player1.reset()
	$Player2.reset()
	$AvatarPlayer1.reset()
	$AvatarPlayer2.reset()
	$DemonPool.demon_tokens = 7
	status = 'battle'
	on_player_turn_ends(2)


func on_player_turn_ends(player):
	if status != 'battle': return
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
	$HUD/FaceInfo.hide()
	$CubeSection/Cast.set_disabled(true)
	$CubeSection/Roll.set_disabled(true)
	active_player.send_cast()

func roll():
	$HUD/FaceInfo.hide()
	active_player.roll()
	
	
func on_battle_ends(winner):
	status = 'ended'
	display_ui(false)
	$HUD/Message.show_message("%s wins" % winner.character_name, 2.0)
	yield($HUD/Message, 'message_ended')
	if winner == $Player2:
		if display_dialogue:
			NarrativeScript.run_script(dialogue_script, 'defeated')
			yield(Events, "dialogue_script_ended")
			$AnimationPlayer.play("restart")
			yield($AnimationPlayer, "animation_finished")
			start_battle()
	else:
		if display_dialogue:
			NarrativeScript.run_script(dialogue_script, 'winner')
			yield(Events, "dialogue_script_ended")

