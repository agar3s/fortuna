extends Node2D


var level_scripts = {
	"level01": {
		"begin": [
			{"right": true, "character": "Alberich", "dialogue": "Engel... Allways your father's shadow"},
			{"right": false, "character": "Engel", "dialogue": "I've trained so hard to reach this point."},
			{"right": false, "character": "Engel", "dialogue": "You are only my first obstacle to be greater than my father."},
			{"right": true, "character": "Alberich", "dialogue": "Last year you couldn't defeat me."},
			{"right": true, "character": "Alberich", "dialogue": "We will see if your training made you a better sorcerer."},
		],
		"defeated": [
			{"right": true, "character": "Alberich", "dialogue": "You need to train more.\nDaddy's child..."}
		],
		"winner": [
			{"right": false, "character": "Engel", "dialogue": "You fought well Alberich. But my power has increased a lot."},
			{"right": true, "character": "Alberich", "dialogue": "Congratulations, you are writting your own name in the history."}
		]
	}
}

func _ready():
	pass # Replace with function body.

func run_script(key, section):
	if not level_scripts.has(key.to_lower()):
		yield(get_tree().create_timer(0.2),"timeout")
		Events.emit_signal('dialogue_script_ended')
		return

	var sequence = level_scripts[key.to_lower()][section]
	
	for script in sequence:
		Events.emit_signal("dialog_triggered", script.right, script.character, script.dialogue)
		yield(Events, "dialog_closed")
	
	Events.emit_signal('dialogue_script_ended')
	
