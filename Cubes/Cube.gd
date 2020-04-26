extends Node2D


export (int) var id = 0
export (Array, int) var face_indexes = [0, 1, 2, 3, 4, 5]
export (String) var title = 'sample cube'


# Called when the node enters the scene tree for the first time.
func _ready():
	var index = 0
	for child in $Faces.get_children():
		child.id = face_indexes[index]
		index += 1


