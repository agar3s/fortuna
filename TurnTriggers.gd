extends Node


var triggers = {
	"level01": [
		{"turn": 1, "event": "force_faces", "player": "Player1", "faces": ['07', '06', '06']},
		{"turn": 1, "event": "show_tutorial", "step": '01'},
		{"turn": 2, "event": "force_faces", "player": "Player2", "faces": ['07', '07', '14']},
		{"turn": 2, "event": "show_tutorial", "step": '02'},
		{"turn": 3, "event": "force_faces", "player": "Player1", "faces": ['01', '01', '06']},
		{"turn": 3, "event": "show_tutorial", "step": '03'},
		{"turn": 4, "event": "force_faces", "player": "Player1", "faces": ['13', '13', '13']},
		{"turn": 4, "event": "show_tutorial", "step": '04'},
		{"turn": 5, "event": "show_tutorial", "step": '05'},
		{"turn": 7, "event": "force_faces", "player": "Player1", "faces": ['07', '08', '06']},
	],
	# not so possible if the player change cubes
	"level04": [
		{"turn": 2, "event": "force_faces", "player": "Player1", "faces": ['*', '12', '*']},
		{"turn": 3, "event": "force_faces", "player": "Player1", "faces": ['*', '*', '09']},
		{"turn": 4, "event": "force_faces", "player": "Player1", "faces": ['13', '13', '13']},
		{"turn": 6, "event": "force_faces", "player": "Player1", "faces": ['12', '12', '*']},
	]
}
