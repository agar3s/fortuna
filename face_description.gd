extends Node
# 0 4
#

const values = {
	'01': {
		'id': '01',
		'icon': 4,
		'instant_effect': true,
		'title': 'Demon invocation',
		'description': 'Add 1 demon counter to yourself.',
		'karma': -2,
		'instant': [{
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'pool',
			'to': 'player'
		}]
	},
	'02': {
		'id': '02',
		'icon': 58,
		'instant_effect': true,
		'title': 'Mind Lock',
		'description': 'Lock the dice.\nX3: apply 3 damage to yourself.',
		'karma': -2,
		'instant': [{
			'type': 'lock_dice',
			'target': 'self',
			'from': 'player'
		}]
	},
	'03': {
		'id': '03',
		'icon': 9,
		'instant_effect': true,
		'title': 'Burnout',
		'description': 'Apply 1 damage to yourself.',
		'karma': -1,
		'instant': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	'04': {
		'id': '04',
		'icon': 51,
		'instant_effect': true,
		'title': 'Panic',
		'description': 'Instant: Lock the dice.\nEffect: apply 1 damage to yourself.',
		'karma': -3,
		'instant': [{
			'type': 'lock_dice',
			'target': 'self',
			'from': 'player'
		}]
	},
	'05': {
		'id': '05',
		'icon': 0,
		'instant_effect': true,
		'title': 'Doubt',
		'description': 'Instant: unlock all dices, automatic roll.',
		'karma': -2,
		'instant': [{
			'type': 'unlock_dice',
			'target': 'all',
			'from': 'player'
		}, {
			'type': 'roll',
			'target': 'player'
		}]
	},
	'06': {
		'id': '06',
		'icon': 66,
		'instant_effect': false,
		'title': 'Fire Ball',
		'description': 'Apply 1 fire damage to enemy.',
		'karma': 1,
		'instant': []
	},
	'07': {
		'id': '07',
		'icon': 56,
		'instant_effect': false,
		'title': 'Ice Blast',
		'description': 'Apply 1 ice damage to enemy.',
		'karma': 1,
		'instant': []
	},
	'08': {
		'id': '08',
		'icon': 8,
		'instant_effect': false,
		'title': 'Thunder Bolt',
		'description': 'Apply 1 electric damage to enemy.',
		'karma': 1,
		'instant': []
	},
	'09': {
		'id': '09',
		'icon': 55,
		'instant_effect': false,
		'title': 'Harden',
		'description': 'Prevent 1 future damage.',
		'karma': 1,
		'instant': []
	},
	'10': {
		'id': '10',
		'icon': 1,
		'instant_effect': false,
		'title': 'Poison',
		'description': 'Apply 1 poison damage to enemy.\nApply 1 poison damage to enemy in the next 1 turns.',
		'karma': 2,
		'instant': []
	},
	'11': {
		'id': '11',
		'icon': 62,
		'instant_effect': false,
		'title': 'Shadow pact',
		'description': 'Apply 1 shadow damage to enemy in the next 2 turns.',
		'karma': 2,
		'instant': []
	},
	'12': {
		'id': '12',
		'icon': 53,
		'instant_effect': false,
		'title': 'Heal',
		'description': 'Recover 1 hit points.',
		'karma': 1,
		'instant': []
	},
	'13': {
		'id': '13',
		'icon': 59,
		'instant_effect': false,
		'title': 'Control',
		'description': 'X3 destroy all demon counters',
		'karma': 1,
		'instant': []
	},
	'14': {
		'id': '14',
		'icon': 71,
		'instant_effect': false,
		'title': 'Focus',
		'description': 'Remove 1 harmful state',
		'karma': 1,
		'instant': []
	},
	'15': {
		'id': '15',
		'icon': 219,
		'instant_effect': false,
		'title': 'Pact',
		'description': 'Remove 1 demon counter. Apply 1 damage to yourself.',
		'karma': 1,
		'instant': []
	},
	'16': {
		'id': '16',
		'icon': 65,
		'instant_effect': false,
		'title': 'Incriminate',
		'description': 'Transfer 1 demon counter from you to your enemy\n Apply 2 damage to yourself.',
		'karma': 1,
		'instant': []
	},
	'17': {
		'id': '17',
		'icon': 48,
		'instant_effect': false,
		'title': 'Blood Drain',
		'description': 'Apply 1 neutral damage to enemy.\nRecover 1 hit points.',
		'karma': 2,
		'instant': []
	},
	'18': {
		'id': '18',
		'icon': 178,
		'instant_effect': false,
		'title': 'Lament',
		'description': 'Apply 1 neutral damage to enemy.\nApply 1 neutral damage to yourself.',
		'karma': 1,
		'instant': []
	}
}
