extends Node

var current_scene

func _ready():
	Events.connect("battle_won", self, 'next_scene')
	Events.connect("change_scene", self, 'next_scene')
	#next_scene('Intro')
	next_scene('Map01')


func next_scene(scene):
	$AnimationPlayer.play("fade")
	yield($AnimationPlayer, "animation_finished")
	if current_scene:
		current_scene.queue_free()
	var level = load("res://Levels/%s.tscn" % [scene])
	current_scene = level.instance()
	add_child(current_scene)
	$AnimationPlayer.play_backwards("fade")
