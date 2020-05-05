extends Node

signal rune_added

# as the inventory is fixed I just enumerate if the item is present or not
export (bool) var rune_a = false setget set_rune_a
export (bool) var rune_b = false setget set_rune_b
export (bool) var rune_c = false setget set_rune_c
export (bool) var rune_d = false setget set_rune_d
export (bool) var rune_e = false setget set_rune_e
export (bool) var rune_f = false setget set_rune_f
export (bool) var spell_book = false setget set_spell_book
export (bool) var cube_bag = false setget set_cube_bag


func _ready():
	Events.connect('object_adquired', self, 'add_item')


func add_item(_object):
	match _object:
		'rune_a': set_rune_a(true)
		'rune_b': set_rune_b(true)
		'rune_c': set_rune_c(true)
		'rune_d': set_rune_d(true)
		'rune_e': set_rune_e(true)
		'rune_f': set_rune_f(true)
		'spell_book': set_spell_book(true)
		'cube_bag': set_cube_bag(true)


func set_rune_a(_rune_a):
	rune_a = _rune_a
	if rune_a:
		emit_signal('rune_added')

func set_rune_b(_rune_b):
	rune_b = _rune_b
	if rune_b:
		emit_signal('rune_added')

func set_rune_c(_rune_c):
	rune_c = _rune_c
	if rune_c:
		emit_signal('rune_added')

func set_rune_d(_rune_d):
	rune_d = _rune_d
	if rune_d:
		emit_signal('rune_added')

func set_rune_e(_rune_e):
	rune_e = _rune_e
	if rune_e:
		emit_signal('rune_added')

func set_rune_f(_rune_f):
	rune_f = _rune_f
	if rune_f:
		emit_signal('rune_added')

func set_spell_book(_spell_book):
	spell_book = _spell_book

func set_cube_bag(_cube_bag):
	cube_bag = _cube_bag

