tool
extends Node2D

export (int) var id = 0 setget set_id
export (int) var icon = 4
export (bool) var inmediate_effect = false
export (String) var title = 'face 0'
export (String) var description = 'base fase'
export (int) var karma = 0

func _ready():
	$Sprite.frame = icon

func set_id(value):
	id = value
	var properties = FaceDescription.values[id]
	self.icon = properties.icon
	self.inmediate_effect = properties.inmediate_effect
	self.title = properties.title
	self.description = properties.description
	self.karma = properties.karma
	$Sprite.frame = self.icon

