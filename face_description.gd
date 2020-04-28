extends Node
# 0 4
#

const values = {
	'01': {
		'id': '01',
		'icon': 4,
		'title': 'Demon invocation',
		'description': 'Add 1 demon counter to yourself.',
		'karma': -2,
	},
	'02': {
		'id': '02',
		'icon': 58,
		'title': 'Mind Lock',
		'description': 'Lock the dice.\nX3: apply 3 damage to yourself.',
		'karma': -2
	},
	'03': {
		'id': '03',
		'icon': 9,
		'title': 'Burnout',
		'description': 'Apply 1 damage to yourself.',
		'karma': -1
	},
	'04': {
		'id': '04',
		'icon': 51,
		'title': 'Panic',
		'description': 'Instant: Lock the dice.\nEffect: apply 1 damage to yourself.',
		'karma': -3
	},
	'05': {
		'id': '05',
		'icon': 0,
		'title': 'Doubt',
		'description': 'Instant: unlock all dices, automatic roll.',
		'karma': -2
	},
	'06': {
		'id': '06',
		'icon': 66,
		'title': 'Fire Ball',
		'description': 'Apply 1 fire damage to enemy.',
		'karma': 1
	},
	'07': {
		'id': '07',
		'icon': 56,
		'title': 'Ice Blast',
		'description': 'Apply 1 ice damage to enemy.',
		'karma': 1
	},
	'08': {
		'id': '08',
		'icon': 8,
		'title': 'Thunder Bolt',
		'description': 'Apply 1 electric damage to enemy.',
		'karma': 1
	},
	'09': {
		'id': '09',
		'icon': 55,
		'title': 'Harden',
		'description': 'Prevent 1 future damage.',
		'karma': 1
	},
	'10': {
		'id': '10',
		'icon': 1,
		'title': 'Poison',
		'description': 'Apply 1 poison damage to enemy.\nApply 1 poison damage to enemy in the next 1 turns.',
		'karma': 2
	},
	'11': {
		'id': '11',
		'icon': 62,
		'title': 'Shadow pact',
		'description': 'Apply 1 shadow damage to enemy in the next 2 turns.',
		'karma': 2
	},
	'12': {
		'id': '12',
		'icon': 53,
		'title': 'Heal',
		'description': 'Recover 1 hit points.',
		'karma': 1
	},
	'13': {
		'id': '13',
		'icon': 59,
		'title': 'Control',
		'description': 'X3 destroy all demon counters',
		'karma': 1
	},
	'14': {
		'id': '14',
		'icon': 71,
		'title': 'Focus',
		'description': 'Remove 1 harmful state',
		'karma': 1
	},
	'15': {
		'id': '15',
		'icon': 219,
		'title': 'Pact',
		'description': 'Remove 1 demon counter. Apply 1 damage to yourself.',
		'karma': 1
	},
	'16': {
		'id': '16',
		'icon': 65,
		'title': 'Incriminate',
		'description': 'Transfer 1 demon counter from you to your enemy\n Apply 2 damage to yourself.',
		'karma': 1
	},
	'17': {
		'id': '17',
		'icon': 48,
		'title': 'Blood Drain',
		'description': 'Apply 1 neutral damage to enemy.\nRecover 1 hit points.',
		'karma': 2
	},
	'18': {
		'id': '18',
		'icon': 178,
		'title': 'Lament',
		'description': 'Apply 1 neutral damage to enemy.\nApply 1 neutral damage to yourself.',
		'karma': 1
	}
}
