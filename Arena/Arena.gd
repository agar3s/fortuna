extends Node2D

var active_player
var turn_triggers = []
export (bool) var display_dialogue = true
export (String) var level_name = 'level01'
var status = 'waiting'
var turn = 0
export (String) var next_scene = 'Level02'

func _ready():
	randomize()
	if not has_node('Player1'):
		$Player_placeholder_a.name = 'Player1'
	else:
		$Player_placeholder_a.queue_free()
	if not has_node('Player2'):
		$Player_placeholder_b.name = 'Player2'
	else:
		$Player_placeholder_b.queue_free()
	
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
	$AnimationPlayer.play("start_scene")
	yield($AnimationPlayer, "animation_finished")
	display_ui(false)
	if display_dialogue:
		NarrativeScript.run_script(level_name, 'begin')
		yield(Events, "dialogue_script_ended")
	
	if TurnTriggers.triggers.has(level_name.to_lower()):
		turn_triggers = TurnTriggers.triggers[level_name.to_lower()]
	
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
	turn = 1
	$HUD/Message.show_message("LET THE DUEL BEGINS!", 1.5)
	yield($HUD/Message, 'message_ended')
	yield(get_tree().create_timer(0.5), "timeout")
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
	check_turn_triggers()
	turn += 0.5
	
	var prev_player = $Player1 if player == 1 else $Player2
	active_player = $Player1 if player != 1 else $Player2
	
	prev_player.active = false
	prev_player.get_node('CubeSet').hide()
	if active_player.has_node('Bot'):
		$CubeSection.hide()
	else:
		$CubeSection.show()

	$HUD/Message.show_message("%s's turn" % active_player.character_name)
	yield($HUD/Message, 'message_ended')
	active_player.active = true
	active_player.get_node('CubeSet').show()
	
	$CubeSection/Cast.set_disabled(true)
	$CubeSection/Roll.set_disabled(false)


func check_turn_triggers():
	var index = 0
	for trigger in turn_triggers:
		print(trigger.turn, ' vs ', turn, '  ', trigger.turn == turn)
		if trigger.turn != turn: break
		if trigger.event == 'force_faces':
			get_node(trigger.player).get_node('CubeSet').force_result(trigger.faces)
			#turn_triggers.remove(index)
		index += 1
	
	for _i in range(0, index):
		turn_triggers.remove(0)


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
	$HUD/Message.show_message("ENOUGH!")
	yield($HUD/Message, 'message_ended')
	yield(get_tree().create_timer(0.5), "timeout")
	$HUD/Message.show_message("%s wins" % winner.character_name, 1.0)
	yield($HUD/Message, 'message_ended')
	yield(get_tree().create_timer(0.5), "timeout")
	
	if winner == $Player2:
		if display_dialogue:
			NarrativeScript.run_script(level_name, 'defeated')
			yield(Events, "dialogue_script_ended")
			$AnimationPlayer.play("restart")
			yield($AnimationPlayer, "animation_finished")
			start_battle()
	else:
		if display_dialogue:
			NarrativeScript.run_script(level_name, 'winner')
			yield(Events, "dialogue_script_ended")
			print('should emmit the battle won screen')
			$AnimationPlayer.play("ends_scene")
			yield($AnimationPlayer, "animation_finished")
			Events.emit_signal('battle_won', next_scene)

