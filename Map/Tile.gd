tool
extends "res://Map/HexaCell.gd"
signal cell_clicked

export (float) var stroke = 0.05
export (Texture) var base_sprite = preload("res://Assets/dark grass.png") setget set_base_sprite
export (int) var offset_sprite_y = 0 setget set_offset_sprite_y
export (Vector2) var scale_sprite = Vector2(1.0, 1.0) setget set_scale_sprite
export (bool) var flip_h = false setget set_flip_h

export (bool) var empty = true setget set_empty
# tile on range
var in_range = false setget set_in_range 

var Item: Node2D

func _ready():
	$Sprite.texture = base_sprite
	$Sprite.offset.y = offset_sprite_y
	get_coordinates_by_position()
	
	if has_node('Item'):
		empty = false
		Item = get_node('Item')
	
func add_item(_item):
	empty = false
	Item = _item
	add_child(Item)

func remove_item():
	Item.queue_free()
	empty = true

func set_position(_position):
	.set_position(_position)
	get_coordinates_by_position()
	print('set position')

func set_global_position(_global_position):
	.set_global_position(_global_position)
	print('set global position')


func set_base_sprite(_base_sprite):
	base_sprite = _base_sprite
	if not has_node('Sprite'): return
	$Sprite.texture = base_sprite

func set_offset_sprite_y(_offset_sprite_y):
	offset_sprite_y = _offset_sprite_y
	$Sprite.offset.y = offset_sprite_y


func on_input(_node, _event, _shape):
	if _event is InputEventMouseButton and _event.pressed:
		$Target.visible = false
		emit_signal('cell_clicked')

func allow_movement():
	return empty and in_range

func set_empty(_empty):
	empty = _empty
	
	#$Sprite.visible = not empty

func on_hover():
	if not in_range: return
	.on_hover()
	$Target.visible = true
	

func on_exit():
	if not in_range: return
	.on_exit()
	$Target.visible = false

func set_in_range(_in_range):
	in_range = _in_range
	

func set_scale_sprite(_scale_sprite):
	scale_sprite = _scale_sprite
	$Sprite.scale = scale_sprite

func set_flip_h(_flip_h):
	flip_h = _flip_h
	$Sprite.flip_h = flip_h
