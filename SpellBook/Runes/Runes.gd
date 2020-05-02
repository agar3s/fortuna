extends Node2D

signal on_dropped

var can_drag = false
var current_button = -1
var drag_point = Vector2(0.0, 0.0)
var original_position = Vector2(0.0, 0.0)
var colliding_area = false
# Called when the node enters the scene tree for the first time.
func _ready():
	for triangle in $Pieces.get_children():
		pass

	$Collider.connect('input_event', self, 'on_input')
	$Collider.connect("area_entered", self, 'on_area_entered')
	$Collider.connect("area_exited", self, 'on_area_exited')


func on_input(_node, _event, _shape):
	if _event is InputEventMouseButton and _event.pressed:
		if _event.button_index == BUTTON_LEFT:
			original_position = position
			can_drag = true
			drag_point = position - get_global_mouse_position()
		if _event.button_index == BUTTON_RIGHT:
			self.rotation_degrees += 60
			yield (get_tree().create_timer(0.05), 'timeout')
			if colliding_area:
				self.rotation_degrees -= 60


func drop():
	can_drag = false
	if colliding_area:
		position = original_position
	else:
		emit_signal('on_dropped')

func _process(_delta):
	if can_drag:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			position = drag_point + get_global_mouse_position()
		else:
			drop()
		
func on_area_entered(_area2d):
	colliding_area = true

func on_area_exited(_area2d):
	colliding_area = false
