tool
extends Node2D

export (Texture) var item_texture = preload('res://Cubes/Assets/01_c_demoniaco.jpg') setget set_item_texture

export (bool) var spell = false

export (String, 'obstacle', 'character', 'seal', 'door') var type = 'obstacle'

export (String) var key = 'lena_map01'

var dialog_index = 0

export (bool) var flip_h_over = false setget set_flip_h_over

func _ready():
	$Sprite.texture = item_texture
	if spell:
		$AnimationPlayer.play("seal")


func set_item_texture(_item_texture):
	item_texture = _item_texture
	if not has_node("Sprite"): return
	$Sprite.texture = item_texture
	

func on_click():
	if not $ItemDescriptors.keys.has(key): return
	
	var properties = $ItemDescriptors.keys[key]
	print('event depending on this item in particular')
	# what can do i do?
	# something to pick
	# something to use?
		# open a spell
		# move to another scene
	match type:
		'character':
			# should have two properties: 
			# array of dialog keys
			var dialog_section = properties.dialogs[dialog_index]
			NarrativeScript.run_script(properties.character, dialog_section)
			yield(Events, "dialogue_script_ended")
			if properties.on_dialogue_ends.has(dialog_section):
				var triggers = properties.on_dialogue_ends[dialog_section]
				for trigger in triggers:
					Events.emit_signal(trigger._signal, trigger._params)
			
			dialog_index += 1
			if dialog_index >= properties.dialogs.size():
				dialog_index = properties.dialogs.size() - 1
		'seal':
			Events.emit_signal("seal_activated", properties.seal)
			Events.connect("seal_destroyed", self, 'on_seal_destroyed')


func on_hover():
	pass

func on_seal_destroyed(seal):
	var properties = $ItemDescriptors.keys[key]
	if seal != properties.seal: return
	for trigger in properties.on_sealed_destroyed:
		Events.emit_signal(trigger._signal, trigger._params)
	
	yield(get_tree().create_timer(0.5), "timeout")
	get_parent().remove_item()
	
	
func set_flip_h_over(_flip_h_over):
	flip_h_over = _flip_h_over
	$Sprite.flip_h = flip_h_over

