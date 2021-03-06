tool
extends Node2D

signal cast_solved
signal states_triggered
signal defeated
signal damage_applied
signal healed
signal active_changed
signal demon_tokens_moved(demon_tokens)
signal demon_armor_updated(demon_armor)
signal armor_updated(armor)

const State = preload("res://Arena/State.tscn")

export (String) var character_name = 'demo'
export (bool) var active = false setget set_active
export (int) var order = 1

export (int) var hit_points = 20 setget set_hit_points
export (int) var max_hit_points = 20

export (int) var armor = 0 setget set_armor
export (int) var max_armor = 3

var demon_tokens = 0 setget set_demon_tokens
export (int) var demon_armor = 0 setget set_demon_armor
export (int) var max_demon_armor = 3

export (Texture) var body_texture = preload('res://Arena/Assets/Engel.png') setget set_body_texture
export (Texture) var avatar_texture = preload('res://Arena/Assets/Engel_face.png')
export (Vector2) var body_offset = Vector2(0, 0) setget set_body_offset
export (Vector2) var body_scale = Vector2(1.0, 1.0) setget set_body_scale

export (Array, String) var cube_indexes = ['001', '001', '001']

var states = []
export (int) var side = 1


func _ready():
	
	$Body.texture = body_texture
	$Body.position.y = -$Body.get_rect().size[1]/2
	$Body.offset = body_offset
	$Body.scale = body_scale
	
	$CubeSet.cube_indexes = cube_indexes
	$CubeSet.connect('on_cast', self, 'resolve_cast')
	$CubeSet.connect('cubes_rolled', self, 'on_cubes_rolled')
	Events.connect('demon_pool_empty', self, 'resolve_demon_tokens')


func reset():
	set_active(false)
	for state in $States.get_children():
		state.queue_free()
	set_hit_points(max_hit_points)
	set_demon_tokens(0)
	set_demon_armor(0)
	set_armor(0)
	

func set_hit_points(value):
	hit_points = value


func roll():
	$CubeSet.roll_cubes()


func send_cast():
	$CubeSet.cast()
	
func is_critical_roll():
	return $CubeSet.roll_count == 1


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
	
	if active:
		$CubeSet.reset()
		resolve_states()
	else:
		$CubeSet.locked = true
	
	emit_signal('active_changed', active)


func cast(type):
	print(order, ') cast a spell type: ', type)


func get_damage(damage, type):
	print(order, ') get %s of %s damage' % [damage, type])
	if armor > 0:
		var res = damage - armor
		if res < 0:
			# blocked all damage
			armor -= damage
			damage = 0
		else:
			# blocked armor damage
			damage = res
			armor = 0
		emit_signal('armor_updated', armor)
		
	
	hit_points -= damage
	if damage > 0:
		$HitPointsFeedback.text = '-%s HP' % str(damage)
		$AnimationPlayer.play("on_hit")
		yield($AnimationPlayer, "animation_finished")
	if hit_points <= 0:
		emit_signal('defeated')
	
	print('emit the signal')
	yield(get_tree().create_timer(0.1), "timeout")
	emit_signal("damage_applied")


func recover_damage(value):
	$HitPointsFeedback.text = '+%s HP' % str(value)
	hit_points += value
	if hit_points > max_hit_points:
		hit_points = max_hit_points
	
	$AnimationPlayer.play("on_heal")
	yield($AnimationPlayer, "animation_finished")
	emit_signal("healed")
	


func set_demon_tokens(value):
	demon_tokens = value
	emit_signal('demon_tokens_moved', demon_tokens)


func resolve_demon_tokens():
	get_damage(demon_tokens, 'demons')
	demon_tokens = 0
	emit_signal('demon_tokens_moved', demon_tokens)


func set_armor(value):
	armor = value
	if armor > max_armor:
		armor = max_armor
	emit_signal('armor_updated', armor)

func set_demon_armor(value):
	demon_armor = value
	if demon_armor > max_demon_armor:
		demon_armor = max_demon_armor
	emit_signal('demon_armor_updated', demon_armor)

func add_state(effects, turns, state_type, icon_type):
	var new_state = State.instance()
	new_state.turns = turns
	new_state.effects = effects
	new_state.type = state_type
	new_state.icon = icon_type
	new_state.position.x += $States.get_child_count()*35*side
	$States.add_child(new_state)


func resolve_states():
	var effects = []
	for state in $States.get_children():
		effects += state.effects
		state.turns -= 1
		yield(get_tree().create_timer(0.1), "timeout")

	update_states_position()
	emit_signal('states_triggered', effects)

func update_states_position():
	var index = 0
	for state in $States.get_children():
		state.position.x = index*35*side
		index += 1

# how many removes
func remove_states(quantity, type):
	
	for state in $States.get_children():
		if state.type == type:
			state.queue_free()
			quantity -= 1
			if quantity <= 0:
				break
		yield(get_tree().create_timer(0.1), "timeout")

	update_states_position()

# value is added to the limit
func add_roll_limit(value):
	$CubeSet.roll_limit += value


func set_body_texture(_texture):
	body_texture = _texture
	$Body.texture = body_texture
	$Body.position.y = -$Body.get_rect().size[1]/2

func set_body_offset(_body_offset):
	body_offset = _body_offset
	$Body.offset = body_offset


func set_body_scale(_body_scale):
	body_scale = _body_scale
	$Body.scale = _body_scale

func on_cubes_rolled(_faces):
	pass
