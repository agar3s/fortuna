extends Control


func _ready():
	Events.connect('object_adquired', self, 'add_item')
	$Items/SpellBook.connect("button_down", self, "_on_spell_book_pressed")
	$Items/RuneA.connect("button_down", self, "_on_rune_pressed", ['rune_a'])
	$Items/RuneB.connect("button_down", self, "_on_rune_pressed", ['rune_b'])
	$Items/RuneC.connect("button_down", self, "_on_rune_pressed", ['rune_c'])
	$Items/RuneD.connect("button_down", self, "_on_rune_pressed", ['rune_d'])
	$Items/RuneE.connect("button_down", self, "_on_rune_pressed", ['rune_e'])
	$Items/RuneF.connect("button_down", self, "_on_rune_pressed", ['rune_f'])


func add_item(_object):
	match _object:
		'rune_a': $Items/RuneA.show()
		'rune_b': $Items/RuneB.show()
		'rune_c': $Items/RuneC.show()
		'rune_d': $Items/RuneD.show()
		'rune_e': $Items/RuneE.show()
		'rune_f': $Items/RuneF.show()
		'spell_book': $Items/SpellBook.show()
		'cube_bag': $Items/CubeBag.show()


func _on_spell_book_pressed():
	Events.emit_signal("spell_book_pressed")


func _on_rune_pressed(rune):
	Events.emit_signal("rune_pressed", rune)

