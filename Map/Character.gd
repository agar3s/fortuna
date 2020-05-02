tool
extends Node2D
signal position_reached


export (Vector3) var coordinates = Vector3(0.0, 0.0, 0.0) setget set_coordinates
var target_position = position
var original_position = position
var mov_ratio = 0
var target_mov_ratio = 0.3
var state = 'idle'

func _ready():
	pass # Replace with function body.


func set_coordinates(value):
	coordinates = value


func set_position(position):
	self.position = position

	
func move_to(_position):
	if state!='idle': return
	state = 'moving'
	target_position = _position
	original_position = position
	mov_ratio = 0


func reach_target():
	state = 'idle'
	position = target_position
	emit_signal('position_reached', coordinates)


func _process(_delta):
	if state == 'moving':
		mov_ratio += _delta
		position = lerp(original_position, target_position, mov_ratio/target_mov_ratio)
		if mov_ratio > target_mov_ratio:
			reach_target()
		
