extends Node2D

signal cast_solved

export (int) var hit_points = 20 setget set_hit_points
export (String) var character_name = 'demo'
export (bool) var active = false setget set_active
export (int) var order = 1

var demon_tokens = 0 setget set_demon_tokens
export (int) var armor = 0 setget set_armor
export (int) var max_armor = 3
export (int) var max_hit_points = 20
export (Array, String) var cube_indexes = ['001', '001', '001']

func _ready():
	$Stats/LabelName.text = character_name.capitalize()
	$Stats/LabelDemon.text = 'Demon tokens: ' + str(demon_tokens)
	$Stats/LabelHP.text = 'Hit points: ' + str(hit_points)
	$Stats/LabelArmor.text = 'Armor: ' + str(armor)
	
	$CubeSet.cube_indexes = cube_indexes
	$CubeSet.connect('on_cast', self, 'resolve_cast')
	Events.connect('demon_pool_empty', self, 'resolve_demon_tokens')


func set_hit_points(value):
	hit_points = value
	$Stats/LabelHP.text = 'Hit points: ' + str(hit_points)

func roll():
	$CubeSet.roll_cubes()

func send_cast():
	$CubeSet.cast()

func lock_cubes(_cube_indexes):
	print('going to lock ', _cube_indexes)
	for index in _cube_indexes:
		$CubeSet.get_node('Cubes').get_child(index).locked = true
		print('cube locked ', index)

func force_unlock_cubes(_cube_indexes):
	for index in _cube_indexes:
		print($CubeSet.get_node('Cubes').get_child(index))
		$CubeSet.get_node('Cubes').get_child(index).force_unlock()
		print('cube unlocked ', index)

func resolve_cast(combo):
	emit_signal('cast_solved', combo)

func resolve_instants(combo):
	emit_signal('cast_solved', combo)

func set_active(value):
	active = value
	print ('set active cubes: ', value)
	if active:
		$CubeSet.reset()
	else:
		$CubeSet.locked = true


func cast(type):
	print(order, ') cast a spell type: ', type)


func get_damage(damage, type):
	print(order, ') get %s of %s damage' % [damage, type])
	if armor > 0:
		armor -= damage
		if armor < 0:
			damage = -armor
			armor = 0
			$Stats/LabelArmor.text = 'Armor: ' + str(armor)
		else:
			$Stats/LabelArmor.text = 'Armor: ' + str(armor)
			return
	
	hit_points -= damage
	$Stats/LabelHP.text = 'Hit points: ' + str(hit_points)


func recover_damage(value):
	print(order, ') recover %s hit points' % [value])
	hit_points += value
	if hit_points > max_hit_points:
		hit_points = max_hit_points

	$Stats/LabelHP.text = 'Hit points: ' + str(hit_points)


func set_demon_tokens(value):
	demon_tokens = value
	$Stats/LabelDemon.text = 'Demon tokens: ' + str(demon_tokens)
	


func resolve_demon_tokens():
	get_damage(demon_tokens, 'demons')
	demon_tokens = 0
	$Stats/LabelDemon.text = 'Demon tokens: ' + str(demon_tokens)


func set_armor(value):
	armor = value
	if armor > max_armor:
		armor = max_armor
	$Stats/LabelArmor.text = 'Armor: ' + str(armor)
