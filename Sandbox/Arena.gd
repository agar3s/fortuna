extends Node2D



func _ready():
	$BattleEngine.playerA = $PlayerA
	$BattleEngine.playerB = $PlayerB

	$RollA.connect("button_down", $PlayerA, 'roll')
	$ExecuteA.connect("button_down", $PlayerA, 'send_execute')

	$RollB.connect("button_down", $PlayerB, 'roll')
	$ExecuteB.connect("button_down", $PlayerB, 'send_execute')
	$PlayerB/Body.flip_h = true
	
	$BattleEngine.connect('turn_ended', self, 'on_player_turn_end')
	on_player_turn_end(2)


func on_player_turn_end(player):
	var turn_a = player != 1
	$RollA.disabled = !turn_a
	$ExecuteA.disabled = !turn_a
	$PlayerA.active = turn_a
	
	$RollB.disabled = turn_a
	$ExecuteB.disabled = turn_a
	$PlayerB.active = !turn_a