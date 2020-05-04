tool
extends Node2D

signal on_lock
signal on_keep
signal cube_rolled

export (String) var id = '001' setget set_id
export (Array, int) var face_indexes = ['01','01','01','01','01','01']
export (String) var title = 'sample cube'

var face_up = 0
var locked = false setget set_lock
var keeped = false setget set_keep
var keepable = true
var rolling = false
var index = 0

var next_face_result = ''
var face_ids = {}

func _ready():
	set_id(self.id)
	position.y = 0
	$Hitbox.connect('input_event', self, 'on_input_event')
	$Hitbox.connect('mouse_entered', self, 'on_hover')
	$Hitbox.connect('mouse_exited', self, 'on_out')
	find_face_ids()

func find_face_ids():
	var _index = 0
	for face in $Faces.get_children():
		face_ids[face.id] = _index
		_index += 1


func can_roll():
	return !locked and !keeped

func roll():
	if !can_roll(): return
	rolling = true
	yield (get_tree().create_timer(0.2), 'timeout')
	rolling = false
	yield (get_tree().create_timer(0.05), 'timeout')
	self.set_face(randi()%6)
	yield (get_tree().create_timer(0.07), 'timeout')
	self.set_face(randi()%6)
	yield (get_tree().create_timer(0.1), 'timeout')
	self.set_face(randi()%6)

	if not next_face_result.empty():
		self.set_face(face_ids[next_face_result])
		next_face_result = ''

	keepable = true
	set_keep(true)
	emit_signal('cube_rolled', $Faces.get_child(face_up).id, index)

func _process(_delta):
	if rolling:
		set_face(randi()%6)

func set_face(face_index):
	$Faces.get_child(face_up).hide()
	face_up = face_index
	$Faces.get_child(face_up).show()


func set_id(value):
	id = value
	face_indexes = CubeConfigurations.cubes[id].faces
	var i = 0
	for child in $Faces.get_children():
		child.id = face_indexes[i]
		i += 1
	
	find_face_ids()

func set_keep(value):
	if value and (!keepable or locked):return
	
	if keeped and not value:
		#play animation to discard cube
		$AnimationPlayer.play("discard")
	elif not keeped and value:
		# play animation to keep the cube
		$AnimationPlayer.play("keep")
	
	keeped = value
	emit_signal('on_keep', keeped)
	# temp visual feedback


func set_lock(value):
	print('locking dice ', value)
	locked = value
	emit_signal('on_lock', locked)


func on_input_event(_node, _event, _id):
	if _event is InputEventMouseButton && _event.pressed:
		if !locked:
			set_keep(!keeped)
		else:
			$AnimationPlayer.play("Locked")


func get_face_value():
	return $Faces.get_child(face_up).id

	
func reset():
	position.y = 0
	$AnimationPlayer.play("cube_enters")
	locked = false
	keepable = false
	keeped = false

func force_unlock():
	locked = false
	keeped = false
	keepable = false
	print('set keepable ', keepable)

func hide_cube():
	$AnimationPlayer.play_backwards("cube_enters")


func on_hover():
	Events.emit_signal('cube_mouse_enter', get_face_value(), keeped)


func on_out():
	Events.emit_signal('cube_mouse_exit')


func force_next_result(_next_face_result):
	next_face_result = _next_face_result
