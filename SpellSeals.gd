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
	},
	'alberich_01': {
		'name': 'magic_lock_01',
		'description': '',
		'configuration': [[2,3],[2,4],[2,5],[2,6],[2,7],[3,3],[3,4],[3,5],[3,6],[3,7]],
		'active': true,
		'on_break': ''
	},
	'alberich_02': {
		'name': 'magic_lock_02',
		'description': '',
		'configuration': [[1,5],[1,6],[1,7],[2,5],[2,6],[2,7],[3,5],[3,6],[3,7],[4,6]],
		'active': true,
		'on_break': ''
	},
	'alberich_03': {
		'name': 'magic_lock_03',
		'description': '',
		'configuration': [[1,5],[1,6],[2,5],[2,6],[2,7],[3,5],[3,6],[3,7],[4,5],[4,6]],
		'active': true,
		'on_break': ''
	},
	'alberich_04': {
		'name': 'magic_lock_04',
		'description': '',
		'configuration': [[1,5],[1,6],[1,7],[1,8],[1,9],[2,5],[2,6],[2,7],[2,8],[3,7]],
		'active': true,
		'on_break': ''
	},
	'alberich_05': {
		'name': 'magic_lock_05',
		'description': '',
		'configuration': [[1,4],[1,5],[1,6],[2,3],[2,4],[2,5],[2,6],[2,7],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8]],
		'active': true,
		'on_break': ''
	}
	
}
#[[1,4],[1,5],[1,6],[2,4],[2,6],[2,7],[2,9],[3,7],[3,8],[3,9]],
#[[0,7],[1,6],[1,7],[2,5],[2,6],[2,7],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8],[3,9]],
#[[1,4],[1,5],[1,6],[2,4],[2,5],[2,6],[2,7],[3,4],[3,5],[3,6],[3,7],[4,4],[4,5],[4,6]],
#[[4,3],[4,4],[4,5],[4,6],[4,7],[4,8],[4,9],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[1,6]],						

func destroy_seal(index):
	seals[index].active = false
	Events.emit_signal('seal_destroyed', index)
