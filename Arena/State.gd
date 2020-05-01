extends Node2D

export (int) var turns = 1 setget set_turns
var effects = [] setget set_effects
var type = 'curse' setget set_type


func _ready():
	$Debug.text = '%s turns(%s) -> %s' % [type, turns, effects.size()]

func set_effects(_effects):
	effects = _effects
	$Debug.text = '%s turns(%s) -> %s' % [type, turns, effects.size()]


func set_type(_type):
	type = _type
	$Debug.text = '%s turns(%s) -> %s' % [type, turns, effects.size()]


func set_turns(_turns):
	turns = _turns
	$Debug.text = '%s turns(%s) -> %s' % [type, turns, effects.size()]
	if turns <= 0:
		queue_free()
