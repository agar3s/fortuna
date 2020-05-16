tool
extends Node2D

var HexaCell = preload('res://Map/HexaCell.tscn')
const Item = preload("res://Map/Item.tscn")

# grid snapping 68X84

export (int) var map_height = 5 setget set_map_height
export (int) var map_width = 7 setget set_map_width
export (int) var grid_size = 74 setget set_grid_size
export (float) var tile_size_relation = 1.1 setget set_tile_size_relation
export (String) var level_name = 'Map01'
export (String) var next_scene = 'Map02'

var spell_breaking = false

var map: Dictionary = {}

func _ready():
	for tile in $Tiles.get_children():
		tile.connect('cell_clicked', self, 'on_cell_clicked', [tile])
		map[tile.get_hash()] = tile
	$Character.connect('position_reached', self, 'check_neighbors')
	
	check_neighbors($Character.coordinates)
	Events.connect('item_unlocked', self, 'add_item')
	Events.connect("seal_activated", self, 'deactivate_spell_breaking', [true])
	Events.connect("seal_closed", self, 'deactivate_spell_breaking', [false])
	Events.connect("seal_destroyed", self, 'deactivate_spell_breaking', [false])
	Events.connect("rune_pressed", self, 'show_rune')


func add_item(_object: Dictionary):
	var new_item = Item.instance()
	print(_object)
	new_item.key = _object.key
	new_item.name = 'Item'
	new_item.type = _object.type
	var tile = map[hash(_object.coordinates)]
	tile.add_item(new_item)


func set_map_height(_map_height):
	map_height = _map_height

func set_map_width(_map_width):
	map_width = _map_width

func set_grid_size(_grid_size):
	grid_size = _grid_size

func set_tile_size_relation(_tile_size_relation):
	tile_size_relation = _tile_size_relation

func deactivate_spell_breaking(_seal, _spell_breaking):
	spell_breaking = _spell_breaking

func on_cell_clicked(tile):
	if spell_breaking: return
	if tile.allow_movement():
		move_character_to(tile)
	elif tile.Item:
		if tile.in_range:
			tile.Item.on_click()
		else:
			tile.Item.on_hover()

func move_character_to(tile):
	var prev_tile = map[hash($Character.coordinates)]
	for neighbor in prev_tile.neighbors:
		if map.has(neighbor):
			map[neighbor].in_range = false
	$Character.coordinates = tile.coordinates
	$Character.move_to(tile.position)
	#$AnimationPlayer.play("Move")


func check_neighbors(coordinates):
	var tile = map[hash(coordinates)]
	for neighbor in tile.neighbors:
		if map.has(neighbor):
			map[neighbor].in_range = true

func display_seal():
	spell_breaking = true
	
func show_rune(rune):
	print(rune)
	NarrativeScript.run_script('UI_runes', rune)

