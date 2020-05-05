tool
extends Control

export (bool) var right = true

var avatar_textures = {
	'Engel': preload('res://Arena/Assets/Engel_face.png'),
	'Alberich': preload('res://Arena/Assets/Alberich_face.png'),
	'Lena': preload('res://Arena/Assets/Krystin_face.png'),
	'Reyner': preload('res://Arena/Assets/reyner_face.png'),
	'Krystine': preload('res://Arena/Assets/Krystin_face.png'),
	'Gena': preload('res://Arena/Assets/lamaestra_face.png'),
	'Gunther': preload('res://Arena/Assets/Gunter_face.png')
}

func _ready():
	Events.connect('dialog_triggered', self, 'handle_trigger')
	$Next.connect("button_down", self, 'on_close_dialog')


func handle_trigger(_right, character, text):
	if right != _right: return
	$AvatarContainer/Avatar.texture = avatar_textures[character]
	$Text.bbcode_text = text
	show()
	Events.emit_signal('dialog_displayed')

func on_close_dialog():
	hide()
	Events.emit_signal('dialog_closed')
