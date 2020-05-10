extends Control


var parts = [
	"Welcome back!",
	"I know that you are waiting for this!",
	"One of the most important events of the independence festival is about... to start!",
	"The final combat of the young sorcerers' tournament!",
	"Our first finalist is the current champion",
	"Alberich Stallman! famous for his unbreakable defense",
	"the second finalist is the daughter of Gunther Reizmann",
	"the Demonkiller and hero of the Ixaldre's portal war.",
	"She is Engel Reizmann!"
]

var current_part = -1
var current_text = ""
var current_index = -1
var typing = false

signal next
signal text_displayed

func _ready():
	$Button.connect("button_down", self, '_on_next')
	yield(get_tree().create_timer(0.5), "timeout")
	load_part(0)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')
	
	$Button.visible = false
	load_part(1)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')
	
	$Button.visible = false
	load_part(2)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')
	
	$Button.visible = false
	$AnimationPlayer.play("BackgroundRevealed")
	load_part(3)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')
	
	$Button.visible = false
	$AnimationPlayer.play("Alberich")
	load_part(4)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')

	$Button.visible = false
	$AnimationPlayer.play("AlberichRevealed")
	load_part(5)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')

	$Button.visible = false
	$AnimationPlayer.play("Engel")
	load_part(6)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')

	$Button.visible = false
	load_part(7)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')

	$Button.visible = false
	$AnimationPlayer.play("EngelReveal")
	load_part(8)
	yield(self, 'text_displayed')
	$Button.visible = true
	yield(self, 'next')
	Events.emit_signal('change_scene', 'Level01')

func _process(delta):
	if not typing: return
	var text = parts[current_part]
	var prev_index = int(current_index)
	var last_char = text[prev_index]
	current_index += delta*(5 if last_char =='.' || last_char =='!' else 30)
	var index = int(current_index)
	if index == prev_index: return
	
	if index >= parts[current_part].length():
		typing = false
		emit_signal('text_displayed')
	
	$TextContainer/RichTextLabel.bbcode_text = '[center]%s[/center]' % [text.substr(0, index)]
	
func load_part(part):
	current_index = 0
	current_part = part
	typing = true


func _on_next():
	emit_signal('next')
