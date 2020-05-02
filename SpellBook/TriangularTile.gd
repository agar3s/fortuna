extends Node2D

#signal pressed(button)
#signal released(button)

func _ready():
	pass
	#$Collider.connect('input_event', self, 'on_input')
	


#func on_input(_node, _event, _shape):
#	if _event is InputEventMouseButton and _event.pressed:
#		emit_signal('pressed', _event.button_index)
#	if _event is InputEventMouseButton and !_event.pressed:
#		emit_signal('released', _event.button_index)
