extends Node2D



func _ready():
	$Debug.text = 'Destroy this spell'
	for piece in $pieces.get_children():
		piece.connect('on_dropped', $TriangularGrid, '_on_rune_dropped', [piece])
		piece.connect('on_turned', $TriangularGrid, '_on_rune_turned', [piece])
	
	$TriangularGrid.connect('triangles_checked', self, 'on_triangles_checked')

func on_triangles_checked(correct):
	if correct:
		$Debug.text = 'solved!!!'
	else:
		$Debug.text = 'incorrect'
