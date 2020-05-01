extends Node2D

export (int) var remaining_turns = 0
export (String) var description = 'demo state'


func _ready():
	pass # Replace with function body.


func update_turn():
	remaining_turns -= 1
	if remaining_turns <= 0:
		queue_free()

