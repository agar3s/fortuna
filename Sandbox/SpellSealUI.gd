extends Control

export (String) var seal_id = '01'

func _ready():
	$Debug.text = 'Destroy this spell'
	for piece in $pieces.get_children():
		piece.connect('on_dropped', $TriangularGrid, '_on_rune_dropped', [piece])
		piece.connect('on_turned', $TriangularGrid, '_on_rune_turned', [piece])
	
	Inventory.connect('rune_added', self, 'set_pieces')
	Events.connect("seal_activated", self, 'set_seal_id')
	#set_seal_id(seal_id)
	$TriangularGrid.connect('triangles_checked', self, 'on_triangles_checked')
	set_pieces()
	
	$Background/CloseButton.connect("button_down", self, "close")

func close():
	$AnimationPlayer.play("close")
	yield($AnimationPlayer, "animation_finished")
	hide()
	Events.emit_signal("seal_closed", seal_id)

func on_triangles_checked(correct):
	if correct:
		
		$Debug.text = 'solved!!!'
		$AnimationPlayer.play("destroy")
		#yield(get_tree().create_timer(0.3), "timeout")
		yield($AnimationPlayer, "animation_finished")
		# TODO when people press continue
		SpellSeals.destroy_seal(seal_id)
		#yield(get_tree().create_timer(0.1), "timeout")
		#hide()
	else:
		$Debug.text = 'incorrect'


func set_seal_id(_seal_id):
	$TriangularGrid.modulate = Color(1.0, 1.0, 1.0, 1.0);
	$TriangularGrid.position = Vector2(454, 301);
	$TriangularGrid.scale = Vector2(1.0, 1.0);
	$SealBreaked.modulate.a = 0.0;
	seal_id = _seal_id
	$TriangularGrid.configuration = SpellSeals.seals[seal_id].configuration
	set_pieces()
	$AnimationPlayer.play_backwards("close")
	show()

func set_pieces():
	$pieces/A.visible = Inventory.rune_a
	$pieces/B.visible = Inventory.rune_b
	$pieces/C.visible = Inventory.rune_c
	$pieces/D.visible = Inventory.rune_d
	$pieces/E.visible = Inventory.rune_e
	$pieces/F.visible = Inventory.rune_f
	reset_positions()


func reset_positions():
	$pieces/A.global_position = $Anchors/A.global_position if Inventory.rune_a else Vector2(0, -300)
	$pieces/B.global_position = $Anchors/B.global_position if Inventory.rune_b else Vector2(0, -600)
	$pieces/C.global_position = $Anchors/C.global_position if Inventory.rune_c else Vector2(0, -900)
	$pieces/D.global_position = $Anchors/D.global_position if Inventory.rune_d else Vector2(0, -1200)
	$pieces/E.global_position = $Anchors/E.global_position if Inventory.rune_e else Vector2(0, -1500)
	$pieces/F.global_position = $Anchors/F.global_position if Inventory.rune_f else Vector2(0, -1800)

