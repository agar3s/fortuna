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
			$Next.rect_global_position = $Step01/Position2D.global_position
		'01b':
			$Step01b.show()
			$Next.rect_global_position = $Step01b/Position2D.global_position
		'01c':
			$Step01c.show()
			$Next.rect_global_position = $Step01b/Position2D.global_position
		'02':
			$Step02.show()
			$Next.rect_global_position = $Step02/Position2D.global_position
		'02b':
			$Step02b.show()
			$Next.rect_global_position = $Step02b/Position2D.global_position
		'03':
			$Step03.show()
			$Next.rect_global_position = $Step03/Position2D.global_position
		'03b':
			$Step03b.show()
			$Next.rect_global_position = $Step03b/Position2D.global_position
		'04':
			$Step04.show()
			$Next.rect_global_position = $Step04/Position2D.global_position
		'05':
			$Step05.show()
			$Next.rect_global_position = $Step05/Position2D.global_position
		'05b':
			$Step05b.show()
			$Next.rect_global_position = $Step05b/Position2D.global_position
		'05c':
			$Step05c.show()
			$Next.rect_global_position = $Step05b/Position2D.global_position

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
