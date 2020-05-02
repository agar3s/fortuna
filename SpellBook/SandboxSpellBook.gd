extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print($TriangularGrid/triangles.get_child_count())
	for piece in $pieces.get_children():
		piece.connect('on_dropped', self, '_on_runned_drop', [piece])


func _on_runned_drop(piece):
	var minimal = 5000
	var closest_anchor = piece.global_position
	for point in $TriangularGrid/AnchorPoints.get_children():
		var distance = piece.global_position.distance_squared_to(point.global_position)
		if distance < minimal:
			closest_anchor = point.global_position
			minimal = distance
	
	piece.position = closest_anchor
