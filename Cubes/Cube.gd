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

func _ready():
	set_id(self.id)
	$Hitbox.connect('input_event', self, 'on_input_event')


func can_roll():
	return !locked and !keeped


func roll():
	if !can_roll(): return
	keepable = true
	yield (get_tree().create_timer(0.5), 'timeout')
	self.set_face(randi()%6)
	


func set_face(index):
	self.face_up = index
	for child in $Faces.get_children():
		child.hide()
	
	var current_face = $Faces.get_child(self.face_up)
	current_face.show()
	
	emit_signal('cube_rolled', current_face.id)


func set_id(value):
	id = value
	face_indexes = CubeConfigurations.cubes[id].faces
	var i = 0
	for child in $Faces.get_children():
		child.id = face_indexes[i]
		i += 1


func set_keep(value):
	if !keepable or locked: return
	keeped = value
	emit_signal('on_keep', keeped)
	# temp visual feedback
	self.rotation_degrees = 180 if keeped else 0


func set_lock(value):
	print('locking dice ', value)
	locked = value
	emit_signal('on_lock', locked)


func on_input_event(_node, _event, _id):
	if !locked && _event is InputEventMouseButton && _event.pressed:
		set_keep(!keeped)


func get_face_value():
	return $Faces.get_child(face_up).id

	
func reset():
	locked = false
	keepable = true
	print('set keepable ', keepable)
	set_keep(false)

func force_unlock():
	locked = false
	keeped = false
	keepable = false
	print('set keepable ', keepable)

