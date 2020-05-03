extends Node2D
const Character = preload("res://Arena/Character.gd")

export (Texture) var avatar = preload("res://Arena/Assets/Engel_face.png")
var demon_tokens = 0

var demon_token_texture = preload("res://Cubes/Assets/01_c_demoniaco.jpg")
var character: Character setget set_character

export (int) var side = 1

func _ready():
	$Avatar.texture = avatar


func set_character(_character: Character):
	if character:
		character.disconnect("damage_applied", self, 'update_hitpoints')
		character.disconnect("healed", self, 'update_hitpoints')
		character.disconnect("demon_tokens_moved", self, 'update_demon_tokens')

	character = _character
	character.connect("damage_applied", self, 'update_hitpoints')
	character.connect("healed", self, 'update_hitpoints')
	character.connect("demon_tokens_moved", self, 'update_demon_tokens')
	update_hitpoints()


func update_hitpoints():
	$HitPoints/ProgressBar.value = character.hit_points*100/character.max_hit_points
	$HitPoints/Label.text = '%s/%s' % [character.hit_points, character.max_hit_points]

func set_name(character_name):
	$Text.text = character_name

func update_demon_tokens(value):
	if value == demon_tokens: return
	
	if value > demon_tokens:
		# add tokens
		for _index in range(demon_tokens, value):
			add_demon_token()
	else:
		for _index in range(value, demon_tokens):
			remove_demon_token()


func add_demon_token():
	var token = Sprite.new()
	token.scale = Vector2(0.1, 0.1)
	token.texture = demon_token_texture
	token.position.x = $DemonTokens.get_child_count() * 20 * side
	$DemonTokens.add_child(token)
	demon_tokens += 1

func remove_demon_token():
	var last_token = $DemonTokens.get_child($DemonTokens.get_child_count() - 1)
	$DemonTokens.remove_child(last_token)
	demon_tokens -= 1

func set_avatar(_avatar):
	avatar = _avatar
	$Avatar.texture = avatar
