extends Control


export (int) var page = 0
export (String) var seal = ''
export (String) var title = 'Dark scorpion'
export (String) var description = 'Despite his abilities with poison'

func _ready():
	Events.connect('seal_destroyed', self, 'check_seal')

func show():
	.show()
	print('mi hermano del alma', true)
	if not SpellSeals.seals.has(seal): return
	var active_seal = SpellSeals.seals[seal]
	if not active_seal.active: return
	Events.emit_signal('seal_activated', seal)
	set_page_with_magic()

func hide():
	.hide()
	print('mi hermano del alma', false)


func set_page_with_magic():
	$Title.bbcode_text = '[matrix clean=0.1]%s[/matrix]' % [title]
	$Description.bbcode_text = '[matrix clean=0.1]%s[/matrix]' % [description]


func unlock_page():
	$Title.bbcode_text = title
	$Description.bbcode_text = description


func check_seal(id):
	if id != seal: return
	
	unlock_page()
	
	
