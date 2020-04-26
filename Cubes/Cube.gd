extends Node2D

signal on_lock
signal on_keep

export (int) var id = 0 setget set_id
export (Array, int) var face_indexes = [0, 1, 2, 3, 4, 5]
export (String) var title = 'sample cube'

var face_up = 0
var locked = false setget set_lock
var keeped = false setget set_keep

func _ready():
	var i = 0
	for child in $Faces.get_children():
		child.id = face_indexes[i]
		i += 1
	$Hitbox.connect('input_event', self, 'on_input_event')


func roll():
	if keeped: return
	self.set_face(randi()%6)


func set_face(index):
	self.face_up = index
	for child in $Faces.get_children():
		child.hide()
	$Faces.get_child(self.face_up).show()


func set_id(value):
	id = value


func set_keep(value):
	if locked: return
	keeped = value
	emit_signal('on_keep', keeped)
	# temp visual feedback
	self.rotation_degrees += 180


func set_lock(value):
	locked = value
	emit_signal('on_lock', locked)


func on_input_event(_node, _event, _id):
	if !locked && _event is InputEventMouseButton && _event.pressed:
		set_keep(!keeped)

func get_face_value():
	return $Faces.get_child(face_up).id
