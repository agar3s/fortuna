extends Node2D


export (int) var id = 0 setget set_id
export (Array, int) var face_indexes = [0, 1, 2, 3, 4, 5]
export (String) var title = 'sample cube'

var face_up = 0
var locked = false

func _ready():
	var i = 0
	for child in $Faces.get_children():
		child.id = face_indexes[i]
		i += 1


func roll():
	if locked: return
	self.set_face(randi()%6)


func set_face(index):
	self.face_up = index
	for child in $Faces.get_children():
		child.hide()
	$Faces.get_child(self.face_up).show()


func set_id(value):
	id = value
