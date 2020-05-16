extends TextureButton


func _ready():
	connect("mouse_entered", self, "on_hover")
	connect("mouse_exited", self, "on_exit")

func on_hover():
	self.modulate = Color(1.3, 1.3, 1.3, 1.0)

func on_exit():
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)

