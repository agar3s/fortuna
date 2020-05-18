extends Node


const keys = {
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
		}, {
			"_signal": "item_unlocked",
			"_params": {'key': 'stairs_01', 'coordinates': Vector3(-3.0, -4.0, 7.0), 'type': 'door'}
		}]
	},
	'stairs_01': {
		'item_texture': preload('res://Map/Assets/escalerasx2.png'),
		'item_position': Vector2(-31, -27),
		'item_scale': Vector2(0.5, 0.5),
		'item_flip_h': false,
		'on_enter': [{
			'_signal': 'change_scene',
			'_params': 'Map01c'
		}]
	},
	'lena_map01c': {
		"character": "lena",
		"dialogs": ["start_journey"],
		"on_dialogue_ends": {
			"start_journey": [{
				'_signal': 'change_scene',
				'_params': 'Map02'
			}]
		}
	},
	'palace_map02': {
		'on_enter': [{
			'_signal': 'change_scene',
			'_params': 'Map02b'
		}]
	},
	'reyner_map02': {
		"character": "reyner",
		"dialogs": ["intro"],
		"on_dialogue_ends": {
			"intro": [{
				'_signal': 'change_scene',
				'_params': 'Level02'
			}]
		}
	},
	'krystine_map03': {
		"character": 'krystine',
		"dialogs": ["intro"],
		"on_dialogue_ends": {
			"intro": [{
				'_signal': 'change_scene',
				'_params': 'Level03'
			}]
		}
	},
	'magic_seal_04_01': {
		'seal': 'alberich_01',
		"on_sealed_destroyed": []
	},
	'magic_seal_04_02': {
		'seal': 'alberich_02',
		"on_sealed_destroyed": []
	},
	'magic_seal_04_03': {
		'seal': 'alberich_03',
		"on_sealed_destroyed": []
	},
	'magic_seal_04_04': {
		'seal': 'alberich_04',
		"on_sealed_destroyed": []
	},
	'magic_seal_04_05': {
		'seal': 'alberich_05',
		"on_sealed_destroyed": [{
			"_signal": "item_unlocked",
			"_params": {
				'key': 'alberich_map04',
				'coordinates': Vector3(1.0, 1.0, -2.0),
				'type': 'character'
			}
		}]
	},
	'alberich_map04': {
		"character": "alberich",
		'item_texture': preload('res://Arena/Assets/Alberich.png'),
		'item_position': Vector2(6, -29),
		'item_scale': Vector2(0.4, 0.4),
		'item_flip_h': false,
		"dialogs": ["paimons_gate"],
		"on_dialogue_ends": {
			"paimons_gate": [{
				'_signal': 'change_scene',
				'_params': 'Level05'
			}]
		}
	},
	'alberich_map05b': {
		"character": "alberich",
		"dialogs": ["defeated", "stop"],
		"on_dialogue_ends": {}
	},
	'paimons_fortress': {
		'on_enter': [{
			'_signal': 'change_scene',
			'_params': 'Map06'
		}]
	},
}
