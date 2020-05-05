extends Node
const Character = preload("res://Arena/Character.gd")

signal battle_over
signal turn_ended
signal instants_triggered

export (String) var state = 'start'
var player_a: Character setget set_player_a
var player_b: Character setget set_player_b
var demon_pool setget set_demon_pool

func _ready():
	# automatic roll scheduled by spell
	Events.connect('roll_scheduled', self, 'schedule_roll')


func set_player_a(value: Character):
	player_a = value
	player_a.get_node('CubeSet').connect('cubes_rolled', self, 'solve_instants', [player_a])
	player_a.connect('defeated', self, 'player_defeated', [player_a])
	player_a.connect('cast_solved', self, 'solve_cast', [player_a])
	player_a.connect('states_triggered', self, 'solve_states', [player_a])
	player_a.order = 1


func set_player_b(value: Character):
	player_b = value
	player_b.get_node('CubeSet').connect('cubes_rolled', self, 'solve_instants', [player_b])
	player_b.connect('defeated', self, 'player_defeated', [player_b])
	player_b.connect('cast_solved', self, 'solve_cast', [player_b])
	player_b.connect('states_triggered', self, 'solve_states', [player_b])
	player_b.order = 2


func player_defeated(player):
	state = 'finished'
	var oponent = player_b if player == player_a else player_a
	emit_signal('battle_over', oponent)

func set_demon_pool(value):
	demon_pool = value
	

func solve_instants(faces, player):
	var oponent = player_b if player == player_a else player_a
	print('resolve instants for %s' % [player.order], faces)
	var instant_effects = []
	
	for face in faces:
		var spell: Dictionary = $SpellChecker.values[face[0]]
		if spell.has('instants'):
			for instant in spell.instants:
				instant_effects.append([face[1], instant])
				apply_spell(instant, player, oponent, face[1])
				yield(Events, "spell_casted")
	
	yield(get_tree().create_timer(0.3),"timeout")
	emit_signal('instants_triggered', instant_effects, player)


func solve_cast(values, player):
	var oponent = player_b if player == player_a else player_a
	print('solve cast values')
	print(values)
	var combos = $SpellChecker.find_combos(values, player.is_critical_roll())
	print(combos)
	# curses apply first
	for value in combos:
		for spell in $SpellChecker.values[value].effects:
			apply_spell(spell, player, oponent)
			yield(Events, "spell_casted")

	print("======== emit signal turn over ======== ")
	emit_signal("turn_ended", player.order)


func solve_states(effects, player):
	var oponent = player_b if player == player_a else player_a
	print('\n\nSOLVE STATES for %s' % [player.order], effects)
	
	for effect in effects:
		apply_spell(effect, player, oponent)
		yield(Events, "spell_casted")
		print('spell casted')
	

func apply_spell(spell, from, to, cube_index=-1):
	print('do something ', spell.type)
	$SpellCaster.parse_spell(spell, from, to, cube_index, demon_pool)

func schedule_roll(character):
	print('scheduling roll for player')
	yield (get_tree().create_timer(0.2), 'timeout')
	if character == player_a:
		player_a.roll()
	if character == player_b:
		player_b.roll()



