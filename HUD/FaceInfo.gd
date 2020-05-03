tool
extends Control

export (String) var id = '01' setget set_id
var on_hover = false
var candidate_id = '00'
func _ready():
	Events.connect("cube_mouse_enter", self, 'display_info')
	Events.connect("cube_mouse_exit", self, 'hide_info')

func set_id(_id):
	id = _id
	var face_data = FaceDescription.values[id]
	
	$Title.text = face_data.title
	$Description.bbcode_text = face_data.description
	$Icon/Texture.texture = load(face_data.sprite)

func display_info(_id, _keeped):
	on_hover = true
	candidate_id = _id
	yield(get_tree().create_timer(0.5), "timeout")
	if candidate_id != _id: return
	set_id(_id)
	show()

func hide_info():
	on_hover = false
	candidate_id = id
	hide()
	id = '00'
