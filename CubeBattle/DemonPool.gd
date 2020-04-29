extends Node2D

var demon_tokens = 7 setget set_demon_tokens
const limit = 7


func _ready():
	pass


func set_demon_tokens(value):
	print ('using the setget')
	demon_tokens = value

	if demon_tokens <= 0:
		print("emit empty pool")
		yield (get_tree().create_timer(0.1), 'timeout')
		Events.emit_signal('demon_pool_empty')
		demon_tokens = limit

	var i = 1
	for token in $Pool.get_children():
		token.visible = i <= demon_tokens
		i += 1
		

