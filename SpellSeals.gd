extends Node


var seals = {
	'basement_seal': {
		'name': 'basement',
		'description': 'basement seal',
		'configuration': [[2,7],[3,7],[3,5],[3,6]],
		'active': true,
		'on_break': ''
	},
	'rune_b': {
		'name': 'basement seal 1',
		'description': 'seal on basement',
		'configuration': [[2,4],[2,5],[3,4],[3,5]],
		'active': true,
		'on_break': ''
	},
	'rune_f': {
		'name': 'basement seal 2',
		'description': 'basement seal',
		'configuration': [[2,3],[2,4],[2,5],[2,6],[2,7],[3,5],[3,6],[3,7]],
		'active': true,
		'on_break': ''
	},
	'gunthers_book': {
		'name': 'basement book seal',
		'description': 'basement seal',
		'configuration': [[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[3,5],[3,7]],
		'active': true,
		'on_break': ''
	},
	'reyner_page_seal': {
		'name': 'reyner',
		'description': 'reyner information seal',
		'configuration': [[2,5],[2,6],[3,5],[3,6]],
		'active': true,
		'on_break': ''
	}
	
}

func destroy_seal(index):
	seals[index].active = false
	Events.emit_signal('seal_destroyed', index)
