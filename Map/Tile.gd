tool
extends "res://Map/HexaCell.gd"

export (float) var stroke = 0.05
export (Texture) var base_sprite = preload("res://Assets/dark grass.png") setget set_base_sprite
export (int) var offset_sprite_y = 0 setget set_offset_sprite_y


export (bool) var empty = false setget set_empty


func _ready():
	$Sprite.texture = base_sprite
	$Sprite.offset.y = offset_sprite_y
	get_coordinates_by_position()



func set_base_sprite(_base_sprite):
	base_sprite = _base_sprite
	$Sprite.texture = base_sprite

func set_offset_sprite_y(_offset_sprite_y):
	offset_sprite_y = _offset_sprite_y
	$Sprite.offset.y = offset_sprite_y


func on_input(_node, _event, _shape):
	if _event is InputEventMouseButton and _event.pressed:
		set_empty(not empty)


func set_empty(_empty):
	empty = _empty
	$Sprite.visible = not empty

