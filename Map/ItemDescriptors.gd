extends Node


var keys = {
	'lena_map01': {
		"character": "lena",
		"dialogs": ["intro", "end"],
		"on_dialogue_ends": {
			"intro": [{
				"_signal": "object_adquired",
				"_params": "rune_d"
			}, {
				"_signal": "item_unlocked",
				"_params": {'key': 'magic_seal_01', 'coordinates': Vector3(8.0, -14.0, 6.0), 'type': 'seal'}
			}]
		}
	},
	'magic_seal_01': {
		'seal': 'basement_seal',
		"on_sealed_destroyed": [{
			'_signal': 'change_scene',
			'_params': 'Map01b'
		}]
	},
	'magic_seal_01b_a': {
		'seal': 'rune_b',
		"on_sealed_destroyed": [{
			"_signal": "object_adquired",
			"_params": "rune_b"
		}]
	},
	'magic_seal_01b_b': {
		'seal': 'rune_f',
		"on_sealed_destroyed": [{
			"_signal": "object_adquired",
			"_params": "rune_f"
		}]
	},
	'magic_seal_01b_c': {
		'seal': 'gunthers_book',
		"on_sealed_destroyed": [{
			"_signal": "object_adquired",
			"_params": "spell_book"
		}]
	},
}
