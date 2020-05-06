extends Control

var current = '0'

func _ready():
	Events.connect('show_tutorial', self, 'display_tutorial')
	$Next.connect("button_down", self, 'on_next')
	

func display_tutorial(_step):
	show()
	current = _step
	match _step:
		'01':
			$Step01.show()
		'01b':
			$Step01b.show()
		'01c':
			$Step01c.show()
		'02':
			$Step02.show()
		'02b':
			$Step02b.show()
		'03':
			$Step03.show()
		'03b':
			$Step03b.show()
		'04':
			$Step04.show()
		'05':
			$Step05.show()
		'05b':
			$Step05b.show()
		'05c':
			$Step05c.show()
			

func on_next():
	match current:
		'01':
			$Step01.hide()
			display_tutorial('01b')
		'01b':
			$Step01b.hide()
			display_tutorial('01c')
		'01c':
			$Step01c.hide()
			hide()
			Events.emit_signal('tutorial_closed')
		'02':
			$Step02.hide()
			display_tutorial('02b')
		'02b':
			$Step02b.hide()
			hide()
			Events.emit_signal('tutorial_closed')
		'03':
			$Step03.hide()
			display_tutorial('03b')
		'03b':
			$Step03b.hide()
			hide()
			Events.emit_signal('tutorial_closed')
		'04':
			$Step04.hide()
			hide()
			Events.emit_signal('tutorial_closed')
		'05':
			$Step05.hide()
			display_tutorial('05b')
		'05b':
			$Step05b.hide()
			display_tutorial('05c')
		'05c':
			$Step05c.hide()
			hide()
			Events.emit_signal('tutorial_closed')
