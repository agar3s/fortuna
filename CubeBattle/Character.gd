extends Node2D

signal execution_solved

export (int) var hit_points = 1 setget set_hit_points
export (String) var character_name = 'demo'
export (bool) var active = false setget set_active

func _ready():
	$Stats/LabelName.text = character_name.capitalize()
	$CubeSet.connect('on_execute', self, 'resolve_execution')


func set_hit_points(value):
	hit_points = value
	$Stats/LabelHP.text = 'Hit points: ' + str(hit_points)

func roll():
	$CubeSet.roll_cubes()

func send_execute():
	$CubeSet.execute()

func resolve_execution(combo):
	emit_signal("execution_solved", combo)

func resolve_instants(combo):
	emit_signal("execution_solved", combo)

func set_active(value):
	active = value
	if active:
		$CubeSet.reset()
	else:
		$CubeSet.locked = true
