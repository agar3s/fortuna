extends Node2D


export (int) var id = 0
export (Array, int) var face_indexes = [0, 1, 2, 3, 4, 5]
export (String) var title = 'sample cube'
export (bool) var DEBUG = false

var face_up = 0

func _ready():
	var index = 0
	for child in $Faces.get_children():
		child.id = face_indexes[index]
		index += 1


func roll():
	self.set_face(randi()%6)
	
	if DEBUG:
		print('roll> ', self.face_up)


func set_face(index):
	self.face_up = index
	for child in $Faces.get_children():
		child.hide()
	$Faces.get_child(self.face_up).show()

