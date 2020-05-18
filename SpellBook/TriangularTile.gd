tool
extends Node2D

export (bool) var active = false setget set_active
export (bool) var overlapped = false
export (int) var bodies_entered = 0

var coordinates = [0, 0] setget set_coordinates

func _ready():
	$Collider.connect("area_entered", self, "on_area_entered")
	$Collider.connect("area_exited", self, "on_area_exited")
	if active:
		$Polygon2D2.color.a = 1.0
	else:
		$Polygon2D2.color.a = 0.1
	
	set_coordinates([int(self.position.x/64), int(self.position.y/37)])

func is_correct():
	return active == (bodies_entered > 0)

func on_area_entered(_area):
	bodies_entered += 1
	overlapped = true

func on_area_exited(_area):
	bodies_entered -= 1
	overlapped = false

func set_active(_active):
	active = _active
	if active:
		$Polygon2D2.color.a = 1.0
	else:
		$Polygon2D2.color.a = 0.1


func set_coordinates(_coordinates): 
	coordinates = _coordinates
	$Label.text = str(coordinates)
	$Label.rect_rotation -= self.rotation_degrees
	print(coordinates)

func set_rotation_degrees(_rotation_degrees):
	.set_rotation_degrees(_rotation_degrees)
	$Label.rect_rotation -= self.rotation_degrees
