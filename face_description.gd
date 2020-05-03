extends Node
# 0 4
#

const values = {
	'01': {
		'id': '01',
		'icon': 4,
		'sprite': 'res://Cubes/Assets/01_c_demoniaco.jpg',
		'title': 'Demon invocation',
		'description': '[b]Instant:[/b] Add 1 demon token [img=<20>x<20>]res://Cubes/Assets/01_c_demoniaco.jpg[/img] to yourself.',
		'karma': -2,
	},
	'02': {
		'id': '02',
		'icon': 58,
		'sprite': 'res://Cubes/Assets/02_b_mental.jpg',
		'title': 'Mind Lock',
		'description': '[b]Instant:[/b] Lock this cube\n [img=<20>x<20>]res://Cubes/Assets/02_b_mental.jpg[/img][img=<20>x<20>]res://Cubes/Assets/02_b_mental.jpg[/img][img=<20>x<20>]res://Cubes/Assets/02_b_mental.jpg[/img] apply 3 damage to yourself.',
		'karma': -2
	},
	'03': {
		'id': '03',
		'icon': 9,
		'sprite': 'res://Cubes/Assets/03_h_fallido.jpg',
		'title': 'Burnout',
		'description': '[b]Instant:[/b] Apply 1 damage to yourself.',
		'karma': -1
	},
	'04': {
		'id': '04',
		'icon': 51,
		'sprite': 'res://Cubes/Assets/04_panic.jpg',
		'title': 'Panic',
		'description': '[b]Instant:[/b] Lock this cube\n.[b]Cast:[/b] apply 1 damage to yourself.',
		'karma': -3
	},
	'05': {
		'id': '05',
		'icon': 0,
		'sprite': 'res://Cubes/Assets/05_doubt.jpg',
		'title': 'Doubt',
		'description': '[b]Instant:[/b] unlock all cubes. Then all cubes roll automatically.',
		'karma': -2
	},
	'06': {
		'id': '06',
		'icon': 66,
		'sprite': 'res://Cubes/Assets/06_fire_spell.jpg',
		'title': 'Fire Ball',
		'description': '[b]Cast:[/b] Apply 1 fire damage to oponent',
		'karma': 1
	},
	'07': {
		'id': '07',
		'icon': 56,
		'sprite': 'res://Cubes/Assets/07_ice_blast.jpg',
		'title': 'Ice Blast',
		'description': '[b]Cast:[/b] Apply 1 ice damage to oponent',
		'karma': 1
	},
	'08': {
		'id': '08',
		'icon': 8,
		'sprite': 'res://Cubes/Assets/08_thunder_bolt.jpg',
		'title': 'Thunder Bolt',
		'description': '[b]Cast:[/b] Apply 1 electric damage to oponent',
		'karma': 1
	},
	'09': {
		'id': '09',
		'icon': 55,
		'sprite': 'res://Cubes/Assets/09_harden.jpg',
		'title': 'Armor',
		'description': '[b]Cast:[/b] Prevent 1 future damage.',
		'karma': 1
	},
	'10': {
		'id': '10',
		'icon': 1,
		'sprite': 'res://Cubes/Assets/10_poison.jpg',
		'title': 'Poison',
		'description': '[b]Cast:[/b] Apply 1 poison damage to enemy.\nApply 1 poison damage to enemy in the next 1 turns',
		'karma': 2
	},
	'11': {
		'id': '11',
		'icon': 62,
		'sprite': 'res://Cubes/Assets/11_shadow_pact.jpg',
		'title': 'Shadow pact',
		'description': '[b]Cast:[/b] Apply 1 shadow damage to enemy in the next 2 turns.',
		'karma': 2
	},
	'12': {
		'id': '12',
		'icon': 53,
		'sprite': 'res://Cubes/Assets/12_Heal.jpg',
		'title': 'Heal',
		'description': '[b]Cast:[/b] Recover 1 hit points.',
		'karma': 1
	},
	'13': {
		'id': '13',
		'icon': 59,
		'sprite': 'res://Cubes/Assets/13_control.jpg',
		'title': 'Control',
		'description': '[img=<20>x<20>]res://Cubes/Assets/13_control.jpg[/img][img=<20>x<20>]res://Cubes/Assets/13_control.jpg[/img][img=<20>x<20>]res://Cubes/Assets/13_control.jpg[/img]\n[b]Cast:[/b] Remove all your demon tokens [img=<20>x<20>]res://Cubes/Assets/01_c_demoniaco.jpg[/img].',
		'karma': 1
	},
	'14': {
		'id': '14',
		'icon': 71,
		'sprite': 'res://Cubes/Assets/14_focus.jpg',
		'title': 'Focus',
		'description': '[b]Cast:[/b] Remove 1 [img=<20>x<20>]res://Cubes/Assets/10_poison.jpg[/img]/[img=<20>x<20>]res://Cubes/Assets/06_fire_spell.jpg[/img]/[img=<20>x<20>]res://Cubes/Assets/07_ice_blast.jpg[/img][img=<20>x<20>]res://Cubes/Assets/05_doubt.jpg[/img][img=<20>x<20>]res://Cubes/Assets/17_blood_drain.jpg[/img] Harmful state.',
		'karma': 1
	},
	'15': {
		'id': '15',
		'icon': 219,
		'sprite': 'res://Cubes/Assets/15_pact.jpg',
		'title': 'Pact',
		'description': '[b]Cast:[/b] Remove 1 demon token [img=<20>x<20>]res://Cubes/Assets/01_c_demoniaco.jpg[/img]. Then Apply 1 damage to yourself.',
		'karma': 1
	},
	'16': {
		'id': '16',
		'icon': 65,
		'sprite': 'res://Cubes/Assets/16_incriminate.jpg',
		'title': 'Incriminate',
		'description': '[b]Cast:[/b] Transfer 1 demon token [img=<20>x<20>]res://Cubes/Assets/01_c_demoniaco.jpg[/img] from you to your oponent. Then Apply 2 damage to yourself.',
		'karma': 1
	},
	'17': {
		'id': '17',
		'icon': 48,
		'sprite': 'res://Cubes/Assets/17_blood_drain.jpg',
		'title': 'Blood Drain',
		'description': '[b]Cast:[/b] Apply 1 damage your enemy. Then recover 1 hit points.',
		'karma': 2
	},
	'18': {
		'id': '18',
		'icon': 178,
		'sprite': 'res://Cubes/Assets/18_pain.jpg',
		'title': 'Pain',
		'description': '[b]Cast:[/b] Apply 1 damage your enemy. Then Apply 1 damage to yourself.',
		'karma': 1
	}
}
