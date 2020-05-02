tool
extends Node2D

export (int) var id = 0 setget set_id
export (int) var icon = 4
export (String) var texture_resource = 'res://Cubes/Assets/01_c_demoniaco.jpg'
export (String) var title = 'face 0'
export (String) var description = 'base fase'
export (int) var karma = 0

func _ready():
	$Sprite.texture = load(texture_resource)
	#$Sprite.frame = icon

func set_id(value):
	var properties = FaceDescription.values[value]
	id = value
	self.icon = properties.icon
	self.title = properties.title
	self.description = properties.description
	self.karma = properties.karma
	#$Sprite.frame = self.icon
	texture_resource = properties.sprite
	$Sprite.texture = load(texture_resource)

