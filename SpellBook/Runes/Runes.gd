extends Node2D


var can_drag = false
var current_button = -1
var drag_point = Vector2(0.0, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	for triangle in $Pieces.get_children():
		pass

	$Collider.connect('input_event', self, 'on_input')
	


func on_input(_node, _event, _shape):
	if _event is InputEventMouseButton and _event.pressed:
		if _event.button_index == BUTTON_LEFT:
			can_drag = _event.pressed
			drag_point = position - get_global_mouse_position()
		if _event.button_index == BUTTON_RIGHT:
			self.rotation_degrees += 120
			
		
	if _event is InputEventMouseButton and not _event.pressed:
		if _event.button_index == BUTTON_LEFT:
			can_drag = _event.pressed



func _process(_delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag:
		position = drag_point + get_global_mouse_position()
