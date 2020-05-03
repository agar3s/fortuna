tool
extends Node2D

export (int) var turns = 1 setget set_turns
var effects = [] setget set_effects
var type = 'curse' setget set_type
var icon = 'fire' setget set_icon


func _ready():
	pass

func set_effects(_effects):
	effects = _effects

func set_type(_type):
	type = _type


func set_turns(_turns):
	turns = _turns
	if turns <= 0:
		queue_free()
	$LabelTurn.text = str(turns)

func set_icon(_icon):
	icon = _icon
	print('set icon ', icon)
	var texture = ''
	match icon:
		'heal': texture = "res://Cubes/Assets/12_Heal.jpg"
		'fire': texture = "res://Cubes/Assets/06_fire_spell.jpg"
		'shadow': texture = "res://Cubes/Assets/05_doubt.jpg"
		'ice': texture = "res://Cubes/Assets/07_ice_blast.jpg"
		'electric': texture = "res://Cubes/Assets/08_thunder_bolt.jpg"
		'vampire': texture = "res://Cubes/Assets/17_blood_drain.jpg"
		'poison': texture = "res://Cubes/Assets/10_poison.jpg"
		'decrease_speed': texture = "res://Cubes/Assets/07_ice_blast.jpg"
		'increase_speed': texture = "res://Cubes/Assets/08_thunder_bolt.jpg"
	
	$Sprite.texture = load(texture)
