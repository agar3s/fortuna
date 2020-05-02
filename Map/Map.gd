tool
extends Node2D

var HexaCell = preload('res://Map/HexaCell.tscn')

# grid snapping 68X84

export (int) var map_height = 5 setget set_map_height
export (int) var map_width = 7 setget set_map_width
export (int) var grid_size = 74 setget set_grid_size
export (float) var tile_size_relation = 1.1 setget set_tile_size_relation

var map: Dictionary = {}

func _ready():
	$Tiles.connect("tree_entered", self, 'on_tiles_tree_entered')



func set_map_height(_map_height):
	map_height = _map_height

func set_map_width(_map_width):
	map_width = _map_width

func set_grid_size(_grid_size):
	grid_size = _grid_size

func set_tile_size_relation(_tile_size_relation):
	tile_size_relation = _tile_size_relation


func on_tiles_tree_entered():
	print(' on tile entered')
