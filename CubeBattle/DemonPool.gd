extends Node2D

var demon_tokens = 13 setget set_demon_tokens
const limit = 13


func _ready():
	pass


func set_demon_tokens(value):
	print ('using the setget')
	demon_tokens = value
	var i = 1
	for token in $Pool.get_children():
		token.visible = i <= demon_tokens
		i += 1
		
	if demon_tokens <= 0:
		print("emit empty pool")
		Events.emit_signal('demon_pool_empty')
		demon_tokens = limit

