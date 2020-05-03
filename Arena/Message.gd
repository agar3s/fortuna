extends Control
signal message_ended

func _ready():
	hide()

func show_message(message, time=1.0):
	$Text.text = message
	self.show()
	yield(get_tree().create_timer(time), 'timeout')
	self.hide()
	emit_signal('message_ended')
