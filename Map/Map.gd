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
	for tile in $Tiles.get_children():
		tile.connect('cell_clicked', self, 'on_cell_clicked', [tile])
		map[tile.get_hash()] = tile
	$Character.connect('position_reached', self, 'check_neighbors')
	
	check_neighbors($Character.coordinates)


func set_map_height(_map_height):
	map_height = _map_height

func set_map_width(_map_width):
	map_width = _map_width

func set_grid_size(_grid_size):
	grid_size = _grid_size

func set_tile_size_relation(_tile_size_relation):
	tile_size_relation = _tile_size_relation


func on_cell_clicked(tile):
	if tile.allow_movement():
		move_character_to(tile)
	elif tile.Item:
		print('show info about item?')

func move_character_to(tile):
	var prev_tile = map[hash($Character.coordinates)]
	for neighbor in prev_tile.neighbors:
		if map.has(neighbor):
			map[neighbor].in_range = false
	$Character.coordinates = tile.coordinates
	$Character.move_to(tile.position)


func check_neighbors(coordinates):
	var tile = map[hash(coordinates)]
	for neighbor in tile.neighbors:
		if map.has(neighbor):
			map[neighbor].in_range = true
