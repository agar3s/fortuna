extends Node


var seals = {
	'basement_seal': {
		'name': 'basement',
		'description': 'basement seal',
		'configuration': [[2,5],[2,6],[3,5],[3,6]],
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
