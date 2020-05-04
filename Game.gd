extends Node

var current_scene

func _ready():
	Events.connect("battle_won", self, 'next_scene')
	next_scene('Level01')


func next_scene(scene):
	print('alo', scene)
	if current_scene:
		current_scene.queue_free()
	yield(get_tree().create_timer(0.1), 'timeout')
	
	var level = load("res://Levels/%s.tscn" % [scene])
	current_scene = level.instance()
	add_child(current_scene)
