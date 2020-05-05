extends Node


var keys = {
	'lena_map01': {
		"character": "lena",
		"dialogs": ["intro"],
		"on_dialogue_ends": {
			"intro": [{
				"_signal": "object_adquired",
				"_params": "rune_d"
			}, {
				"_signal": "item_unlocked",
				"_params": {'key': 'magic_seal_01', 'coordinates': Vector3(-1.0, -6.0, 7.0), 'type': 'seal'}
			}]
		}
	},
	'magic_seal_01': {
		'seal': 'basement_seal',
		"on_sealed_destroyed": [{
			'_signal': 'change_scene',
			'_params': 'Map01b'
		}]
	}
}
