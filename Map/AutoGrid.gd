tool
extends Node2D

var Tile = preload('res://Map/Tile.tscn')

export (int) var map_height = 5 setget set_map_height
export (int) var map_width = 7 setget set_map_width
export (int) var grid_size = 74 setget set_grid_size
export (float) var tile_size_relation = 1.1 setget set_tile_size_relation

var map: Dictionary = {}

func _ready():
	update_grid()


func update_grid():
	if not has_node('Tiles'): return
	for child in $Tiles.get_children():
		child.queue_free()

	for r in range(0, map_height):
		var r_offset = r>>1
		for q in range(-r_offset, map_width-r_offset):
			var z = -q-r
			var tile = Tile.instance()
			tile.size = grid_size
			tile.size_relation = tile_size_relation
			tile.empty = randf() < 0.3
			tile.coordinates = Vector3(q, z, r)
			$Tiles.add_child(tile)
			map[tile.get_hash()] = tile


func set_map_height(_map_height):
	map_height = _map_height
	update_grid()

func set_map_width(_map_width):
	map_width = _map_width
	update_grid()

func set_grid_size(_grid_size):
	grid_size = _grid_size
	update_grid()

func set_tile_size_relation(_tile_size_relation):
	tile_size_relation = _tile_size_relation
	update_grid()
