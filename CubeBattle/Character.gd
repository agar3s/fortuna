extends Node2D

signal execution_solved

export (int) var hit_points = 1 setget set_hit_points
export (String) var character_name = 'demo'
export (bool) var active = false setget set_active
export (int) var order = 1

var demon_tokens = 0
export (int) var armor = 0 setget set_armor
export (int) var max_armor = 3
export (int) var max_hit_points = 3

func _ready():
	$Stats/LabelName.text = character_name.capitalize()
	$CubeSet.connect('on_execute', self, 'resolve_execution')
	Events.connect('demon_pool_empty', self, 'resolve_demon_tokens')


func set_hit_points(value):
	hit_points = value
	$Stats/LabelHP.text = 'Hit points: ' + str(hit_points)

func roll():
	$CubeSet.roll_cubes()

func send_execute():
	$CubeSet.execute()

func resolve_execution(combo):
	emit_signal("execution_solved", combo)

func resolve_instants(combo):
	emit_signal("execution_solved", combo)

func set_active(value):
	active = value
	if active:
		$CubeSet.reset()
	else:
		$CubeSet.locked = true


func cast(type):
	print(order, ') cast a spell type: ', type)


func get_damage(damage, type):
	print(order, ') get %s of %s damage' % [damage, type])
	if armor > 0:
		var temp = damage
		armor -= damage
		if armor < 0:
			damage = -armor
		else:
			return
	
	hit_points -= damage


func recover_damage(hit_points):
	print(order, ') recover %s hit points' % [hit_points])
	self.hit_points += hit_points
	if self.hit_points > max_hit_points:
		self.hit_points = max_hit_points


func add_demon_tokens(value):
	demon_tokens += value

	
func remove_demon_tokens(value):
	demon_tokens -= value

func resolve_demon_tokens():
	get_damage(demon_tokens, 'demons')
	demon_tokens = 0


func set_armor(value):
	armor = value
	if armor > max_armor:
		armor = max_armor
