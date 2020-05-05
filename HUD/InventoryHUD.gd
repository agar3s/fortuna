extends Control


func _ready():
	Events.connect('object_adquired', self, 'add_item')


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
