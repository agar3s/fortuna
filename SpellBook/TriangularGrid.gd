tool
extends Node2D

signal triangles_checked

func _on_rune_dropped(piece):
	var minimal = 5000
	var closest_anchor = piece.global_position
	for point in $AnchorPoints.get_children():
		var distance = piece.global_position.distance_squared_to(point.global_position)
		if distance < minimal:
			closest_anchor = point.global_position
			minimal = distance
	
	piece.position = closest_anchor
	check_triangles()

func _on_rune_turned(_piece):
	check_triangles()

func check_triangles():
	yield (get_tree().create_timer(0.15), 'timeout')
	var correct = true
	for triangle_tile in $triangles.get_children():
		correct = triangle_tile.is_correct()
		if not correct:
			break
	
	emit_signal('triangles_checked', correct)
