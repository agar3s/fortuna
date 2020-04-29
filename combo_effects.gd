extends Node


const values = {
	# Demon invocation
	'01': {
		'effects': [],
		'instants': [{
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'pool',
			'to': 'player'
		}]
	},
	# Mind Lock
	'02': {
		'effects': [],
		'instants': [{
			'type': 'lock_dice',
			'target': 'self',
			'from': 'player'
		}]
	},
	# Mind Lock
	'02-02-02': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Mind Lock critical
	'02-02-02!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}, {
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'pool',
			'to': 'player'
		}]
	},
	# Burnout
	'03': {
		'effects': [],
		'instants': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Panic
	'04': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}],
		'instants': [{
			'type': 'lock_dice',
			'target': 'self',
			'from': 'player'
		}]
	},
	# Panic X2
	'04-04': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Panic X3
	'04-04-04': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Doubt
	'05': {
		'effects': [],
		'instants': [{
			'type': 'unlock_dice',
			'target': 'all',
			'from': 'player'
		}, {
			'type': 'roll',
			'target': 'player'
		}]
	},
	# Fire Ball
	'06':{
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'fire',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Fire Ball X2
	'06-06':{
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'fire',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Fire Ball X3 
	'06-06-06':{
		'effects': [{
			'type': 'apply_damage',
			'damage': 5,
			'damage_type': 'fire',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'fire',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Fire Ball X3 critic
	'06-06-06!':{
		'effects': [{
			'type': 'apply_damage',
			'damage': 7,
			'damage_type': 'fire',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'fire',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Fire Ball comodin
	'06-06-14':{
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'fire',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'fire',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Ice Blast
	'07': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'ice',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Ice Blast x1
	'07-07': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'ice',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Ice Blast X3 ?
	'07-07-07': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 5,
			'damage_type': 'ice',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'modify_roll_limit_state',
			'value': -1,
			'turns': 1,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Ice Blast X3 critic
	'07-07-07!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 7,
			'damage_type': 'ice',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'modify_roll_limit_state',
			'value': -2,
			'turns': 1,
			'from': 'player',
			'to': 'enemy'
			
		}]
	},
	# Ice Blast X3 comodin
	'07-07-14': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'ice',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'ice',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Thunder Bolt
	'08': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'electric',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Thunder Bolt X2
	'08-08': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'electric',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Thunder Bolt x3?
	'08-08-08': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 5,
			'damage_type': 'electric',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'modify_roll_limit_state',
			'value': 1,
			'turns': 1,
			'from': 'player',
			'to': 'player'
		}]
	},
	# Thunder Bolt x3 critic
	'08-08-08!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 7,
			'damage_type': 'electric',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'modify_roll_limit_state',
			'value': 1,
			'turns': 2,
			'from': 'player',
			'to': 'player'
		}]
	},
	# Thunder Bolt X3 comodin
	'08-08-14': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'electric',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'electric',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Harden
	'09': {
		'effects': [{
			'type': 'prevent_damage',
			'damage': 1,
			'to': 'player'
		}]
	},
	# Harden X2
	'09-09': {
		'effects': [{
			'type': 'prevent_damage',
			'damage': 2,
			'to': 'player'
		}]
	},
	# Harden X3
	'09-09-09': {
		'effects': [{
			'type': 'prevent_damage',
			'damage': 5,
			'to': 'player'
		}]
	},
	# Harden X3 critic
	'09-09-09!': {
		'effects': [{
			'type': 'prevent_damage',
			'damage': 7,
			'to': 'player'
		}, {
			'type': 'recover_damage',
			'hit_points': 3,
			'to': 'player'
		}]
	},
	# Poison
	'10': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'poison',
			'from': 'player',
			'to': 'enemy'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'poison',
			'turns': 1,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Poison X2
	'10-10': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'poison',
			'from': 'player',
			'to': 'enemy'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'poison',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Poison X3 ?
	'10-10-10': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 4,
			'damage_type': 'poison',
			'from': 'player',
			'to': 'enemy'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'poison',
			'turns': 4,
			'from': 'player',
			'to': 'enemy'
		}]
	},

	# Poison X3 critic
	'10-10-10!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 5,
			'damage_type': 'poison',
			'from': 'player',
			'to': 'enemy'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 2,
			'damage_type': 'poison',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Poison X3 comodin
	'10-10-14': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'poison',
			'from': 'player',
			'to': 'enemy'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'poison',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Shadow pact
	'11': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'pool',
			'to': 'player'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'shadow',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Shadow pact X2
	'11-11': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 2,
			'from': 'pool',
			'to': 'player'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 2,
			'damage_type': 'shadow',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Shadow pact X3
	'11-11-11': {
		'effects': [
		{
			'type': 'apply_continuous_damage',
			'damage': 3,
			'damage_type': 'shadow',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Shadow pact X3 critic
	'11-11-11!': {
		'effects': [{
			'type': 'apply_continuous_damage',
			'damage': 3,
			'damage_type': 'shadow',
			'turns': 4,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Shadow pact X3 comodin
	'11-11-14': {
		'effects': [
		{
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'pool',
			'to': 'player'
		},
		{
			'type': 'apply_continuous_damage',
			'damage': 2,
			'damage_type': 'shadow',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Heal
	'12': {
		'effects': [{
			'type': 'recover_damage',
			'hit_points': 1,
			'to': 'player'
		}]
	},
	# Heal X2
	'12-12': {
		'effects': [{
			'type': 'recover_damage',
			'hit_points': 2,
			'to': 'player'
		}]
	},
	# Heal x3 
	'12-12-12': {
		'effects': [{
			'type': 'recover_damage',
			'hit_points': 3,
			'to': 'player'
		},{
			'type': 'recover_continuous_damage',
			'hit_points': 1,
			'turns': 2,
			'to': 'player'
		}]
	},
	# Heal x3  critic
	'12-12-12!': {
		'effects': [{
			'type': 'recover_damage',
			'hit_points': 5,
			'to': 'player'
		},{
			'type': 'recover_continuous_damage',
			'hit_points': 2,
			'turns': 3,
			'to': 'player'
		}]
	},
	# Control
	'13': {
		'effects': []
	},
	# Control X3 ??
	'13-13-13': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 'all',
			'from': 'player',
			'to': 'pool'
		},{
			'type': 'prevent_demon_counter',
			'quantity': 1
		}]
	},
	# Control X3 critic
	'13-13-13!': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 'all',
			'from': 'player',
			'to': 'pool'
		},{
			'type': 'prevent_demon_counter',
			'quantity': 3
		}]
	},
	# Focus
	'14': {
		'effects': [{
			'type': 'remove_state',
			'to': 'player',
			'quantity': 1,
			'state_type': 'curse'
		}]
	},
	# Focus X2
	'14-14': {
		'effects': [{
			'type': 'remove_state',
			'to': 'player',
			'quantity': 2,
			'state_type': 'curse'
		}]
	},
	# Focus
	'14-14-14': {
		'effects': [{
			'type': 'remove_state',
			'to': 'player',
			'quantity': 'all',
			'state_type': 'curse'
		}]
	},
	# Focus
	'14-14-14!': {
		'effects': [{
			'type': 'remove_state',
			'to': 'player',
			'quantity': 'all',
			'state_type': 'curse'
		}, {
			'type': 'transfer_demon_counter',
			'quantity': 3,
			'from': 'player',
			'to': 'pool'
		}, {
			'type': 'recover_damage',
			'hit_points': 3,
			'to': 'player'
		}]
	},
	# Pact
	'15': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'player',
			'to': 'pool'
		}, {
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Pact X2
	'15-15': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 2,
			'from': 'player',
			'to': 'pool'
		},
		{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Pact X3
	'15-15-15': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 3,
			'from': 'player',
			'to': 'enemy'
		},
		{
			'type': 'recover_damage',
			'hit_points': 2,
			'to': 'player'
		}]
	},
	# Pact X3 critic
	'15-15-15!': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 4,
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'recover_damage',
			'hit_points': 3,
			'to': 'player'
		}]
	},
	# Incriminate
	'16': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Incriminate X2
	'16-16': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 2,
			'from': 'player',
			'to': 'enemy'
		},
		{
			'type': 'apply_damage',
			'damage': 4,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Incriminate X3
	'16-16-16': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 'all',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Incriminate X3
	'16-16-16!': {
		'effects': [{
			'type': 'transfer_demon_counter',
			'quantity': 'all',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'shadow',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Blood Drain
	'17': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'recover_damage',
			'hit_points': 1,
			'to': 'player'
		}]
	},
	# Blood Drain X2
	'17-17': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'recover_damage',
			'hit_points': 2,
			'to': 'player'
		}]
	},
	# Blood Drain X3
	'17-17-17': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 4,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'recover_damage',
			'hit_points': 4,
			'to': 'player'
		}]
	},
	# Blood Drain X3 critic
	'17-17-17!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 5,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'recover_damage',
			'hit_points': 5,
			'to': 'player'
		}]
	},
	# Blood Drain X3 comodin
	'14-17-17': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'recover_damage',
			'hit_points': 3,
			'to': 'player'
		}]
	},
	# Lament
	'18': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Lament X2
	'18-18': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Lament x3
	'18-18-18': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 5,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Lament x3 critic
	'18-18-18!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 7,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_damage',
			'damage': 4,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Lament X3 comodin
	'14-18-18': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 4,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		},{
			'type': 'apply_damage',
			'damage': 4,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}]
	},
	# Element crusher
	'06-07-08': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 5,
			'damage_type': 'elemental',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Element crusher critic
	'06-07-08!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 6,
			'damage_type': 'elemental',
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Vampire bites
	'10-17-18': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_continuous_drain_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Vampire bites critic
	'10-17-18!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 3,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_continuous_drain_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Aquelarre
	'11-15-16': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 2,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}, {
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'shadow',
			'turns': 2,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# Aquelarre critic
	'11-15-16!': {
		'effects': [{
			'type': 'apply_damage',
			'damage': 1,
			'damage_type': 'neutral',
			'from': 'player',
			'to': 'player'
		}, {
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'player',
			'to': 'enemy'
		}, {
			'type': 'apply_continuous_damage',
			'damage': 1,
			'damage_type': 'shadow',
			'turns': 3,
			'from': 'player',
			'to': 'enemy'
		}]
	},
	# get ready
	'09-12-13': {
		'effects': [{
			'type': 'prevent_damage',
			'damage': 1,
			'to': 'player'
		}, {
			'type': 'recover_damage',
			'hit_points': 1,
			'to': 'player'
		}, {
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'player',
			'to': 'pool'
		}]
	},
	# get ready critic
	'09-12-13!': {
		'effects': [{
			'type': 'prevent_damage',
			'damage': 1,
			'to': 'player'
		}, {
			'type': 'recover_damage',
			'hit_points': 2,
			'to': 'player'
		}, {
			'type': 'transfer_demon_counter',
			'quantity': 1,
			'from': 'player',
			'to': 'pool'
		}]
	}
}


func find_combos(faces: Array, is_critical = false):
	faces.sort()
	
	# check combo of 3
	var combo = '%s-%s-%s' % faces
	if is_critical and values.has(combo + '!'):
		return [combo + '!']
		
	if values.has(combo):
		return [combo]
	
	combo = ['%s-%s' % [faces[0], faces[1]], faces[2]]
	if values.has(combo[0]):
		return combo
	
	combo = [faces[0], '%s-%s' % [faces[1], faces[2]]]
	if values.has(combo[1]):
		return combo

	return faces

func find_probabilities(faces1: Array, faces2: Array, faces3: Array):
	var combinations = []
	
	for a in faces1:
		for b in faces2:
			for c in faces3:
				combinations.append([a, b, c])
	
	var unique_combos = {}
	for combination in combinations:
		var combos = find_combos(combination)
		for combo in combos:
			if not unique_combos.has(combo):
				unique_combos[combo] = { 'total': 0, 'prob': 0, 'triple': combo.length() == 8 }
			unique_combos[combo].total += 1.0
			unique_combos[combo].prob = 100*unique_combos[combo].total/combinations.size()
	
	return unique_combos
	
