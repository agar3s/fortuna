extends Node2D


var level_scripts = {
	"level01": {
		"begin": [
			{"right": true, "character": "Alberich", "dialogue": "Oh, Engel... "},
			{"right": true, "character": "Alberich", "dialogue": "You'll always live under the shadow of your father."},
			{"right": false, "character": "Engel", "dialogue": "I've trained so hard to reach this point Alberich."},
			{"right": false, "character": "Engel", "dialogue": "I'm proud to be the daughter of the DemonKiller."},
			{"right": false, "character": "Engel", "dialogue": "But today I'll show everybody that I can be even better than him."},
			{"right": true, "character": "Alberich", "dialogue": "Last year you couldn't defeat me."},
			{"right": true, "character": "Alberich", "dialogue": "will see if your training made you a better sorcerer."},
		],
		"defeated": [
			{"right": true, "character": "Alberich", "dialogue": "You need to train more.\nDaddy's child..."}
		],
		"winner": [
			{"right": false, "character": "Engel", "dialogue": "You fought well... But my power has increased a lot."},
			{"right": true, "character": "Alberich", "dialogue": "Well done, maybe I was wrong about you..."}
		]
	},
	"lena": {
		"intro": [
			{"right": false, "character": "Engel", "dialogue": "Mom, I'm back!"},
			{"right": false, "character": "Engel", "dialogue": "I won the tournament!"},
			{"right": true, "character": "Lena", "dialogue": "Finally..."},
			{"right": true, "character": "Lena", "dialogue": "It took longer than expected."},
			{"right": false, "character": "Engel", "dialogue": "Mon, win that tournament is a great achievement"},
			{"right": false, "character": "Engel", "dialogue": "Everybody in town recognizes me as a great sorcerer"},
			{"right": true, "character": "Lena", "dialogue": "That tournament is just a child's play."},
			{"right": true, "character": "Lena", "dialogue": "Real sorcerers fight in epic battles, against gods and demons..."},
			{"right": true, "character": "Lena", "dialogue": "Like your father used to..."},
			{"right": false, "character": "Engel", "dialogue": "... and he died because of that."},
			{"right": true, "character": "Lena", "dialogue": "..."},
			{"right": true, "character": "Lena", "dialogue": "Now that You prove you are capable of doing some sorcery..."},
			{"right": true, "character": "Lena", "dialogue": "I think it's time to tell you the truth..."},
			{"right": false, "character": "Engel", "dialogue": "What truth?"},
			{"right": true, "character": "Lena", "dialogue": "Your father didn't die in war."},
			{"right": true, "character": "Lena", "dialogue": "He is alive"},
			{"right": false, "character": "Engel", "dialogue": "!!!"},
			{"right": false, "character": "Engel", "dialogue": "What are you talking about?"},
			{"right": true, "character": "Lena", "dialogue": "After the war ends he started a journey with a group of sorcerers."},
			{"right": true, "character": "Lena", "dialogue": "... they were looking at how to prevent future invasions"},
			{"right": true, "character": "Lena", "dialogue": "... but they discovered a great power in the portal's borders."},
			{"right": true, "character": "Lena", "dialogue": "your father tried to access that power, but the other sorcerers were afraid of him"},
			{"right": true, "character": "Lena", "dialogue": "they decided to betray and imprison him!"},
			{"right": false, "character": "Engel", "dialogue": "How to do you know all of these?"},
			{"right": true, "character": "Lena", "dialogue": "Because of Reyner. One of the sorcerers came here..."},
			{"right": true, "character": "Lena", "dialogue": "He told me part of the story, but I figure out the other..."},
			{"right": true, "character": "Lena", "dialogue": "My guess is he was trying to find a cure for my illness..."},
			{"right": true, "character": "Lena", "dialogue": "a cure that you can only get from ancient sorcery."},
			{"right": false, "character": "Engel", "dialogue": "Why do you wait all this time for telling me this?"},
			{"right": true, "character": "Lena", "dialogue": "Because we couldn't do anything at that time"},
			{"right": true, "character": "Lena", "dialogue": "But now it's different"},
			{"right": false, "character": "Engel", "dialogue": "All this time, I believe he was dead..."},
			{"right": true, "character": "Lena", "dialogue": "Engel!"},
			{"right": false, "character": "Engel", "dialogue": "!"},
			{"right": true, "character": "Lena", "dialogue": "Pay attention, you need to setting him free!"},
			{"right": false, "character": "Engel", "dialogue": "Absolutely, but how?"},
			{"right": true, "character": "Lena", "dialogue": "Start with this"},
			{"right": true, "character": "Lena", "dialogue": "is a powerful crystal, it allows you to see and destroy magic seals."},
			{"right": true, "character": "Lena", "dialogue": "Use it to reveal the secrets you father hid here"},
			{"right": true, "character": "Lena", "dialogue": "When you know enough to start your search, come back."}
		],
		"end": [
			{"right": true, "character": "Lena", "dialogue": "What are you waiting for?"},
			{"right": true, "character": "Lena", "dialogue": "When you know enough to start your search, come back."}
		],
		"start_journey": [
			{"right": false, "character": "Engel", "dialogue": "I got my father's book and other 2 crystals."},
			{"right": false, "character": "Engel", "dialogue": "What should I do?"},
			{"right": true, "character": "Lena", "dialogue": "The sorcerers you found in that book should know your father's location."},
			{"right": true, "character": "Lena", "dialogue": "Fortunately, I know that Reyner lives in a hidden palace in the desert."},
			{"right": true, "character": "Lena", "dialogue": "Start with him."},
			{"right": false, "character": "Engel", "dialogue": "I'll do that!"},
			{"right": true, "character": "Lena", "dialogue": "Engel..."},
			{"right": false, "character": "Engel", "dialogue": "Mom..."},
			{"right": true, "character": "Lena", "dialogue": "Bring your father home"},
			{"right": false, "character": "Engel", "dialogue": "..."},
			{"right": false, "character": "Engel", "dialogue": "Yes"},
		]
	},
	"reyner": {
		"intro": [
			{"right": true, "character": "Reyner", "dialogue": "What are you doing here, child?"},
			{"right": false, "character": "Engel", "dialogue": "You are Reyner The Red Scorpion."},
			{"right": false, "character": "Engel", "dialogue": "My name is Engel Reizmann daugther of Gunther Reizman, the DemonKiller!"},
			{"right": true, "character": "Reyner", "dialogue": "Ha!"},
			{"right": true, "character": "Reyner", "dialogue": "... You mean the Demon Summoner."},
			{"right": false, "character": "Engel", "dialogue": "Everything he did, he did it to save his wife."},
			{"right": true, "character": "Reyner", "dialogue": "Gunther was a selfish man..."},
			{"right": true, "character": "Reyner", "dialogue": "Everything he did was for his own glory."},
			{"right": true, "character": "Reyner", "dialogue": "Why do you come here?"},
			{"right": false, "character": "Engel", "dialogue": "I want to know my father location"},
			{"right": true, "character": "Reyner", "dialogue": "Ha!"},
			{"right": true, "character": "Reyner", "dialogue": "... your father is trapped in Paimon's fortress"},
			{"right": true, "character": "Reyner", "dialogue": "... and will be there for all the eternity"},
			{"right": false, "character": "Engel", "dialogue": "Well..."},
			{"right": false, "character": "Engel", "dialogue": "[shake rate=30 level=10]I'll set him free![/shake]"},
			{"right": true, "character": "Reyner", "dialogue": "Ha!"},
			{"right": true, "character": "Reyner", "dialogue": "... Even if you can make it to that place"},
			{"right": true, "character": "Reyner", "dialogue": "You'll still need all the six BeastHearth's pieces."},
			{"right": false, "character": "Engel", "dialogue": "I already have three of them"},
			{"right": false, "character": "Engel", "dialogue": "... and I'll find the way to get the other three."},
			{"right": true, "character": "Reyner", "dialogue": "[shake rate=30 level=10]!!![/shake]"},
			{"right": true, "character": "Reyner", "dialogue": "That's too much power for a child!"},
			{"right": true, "character": "Reyner", "dialogue": "[shake rate=30 level=10]Give them to me![/shake]"},
			{"right": false, "character": "Engel", "dialogue": "Of course not"},
			{"right": false, "character": "Engel", "dialogue": "you will be the one to give me yours"},
			{"right": true, "character": "Reyner", "dialogue": "We shall see..."},
		]
	},
	"level02": {
		"begin": [
			{"right": true, "character": "Reyner", "dialogue": "Show me what you can do!"}
		],
		"defeated": [
			{"right": true, "character": "Reyner", "dialogue": "Ha!"},
			{"right": true, "character": "Reyner", "dialogue": "Did you really think you could defeat the Red Scorpion?"}
		],
		"winner": [
			{"right": true, "character": "Reyner", "dialogue": "This cannot be true"},
			{"right": false, "character": "Engel", "dialogue": "I'll get your BeastHearth piece..."},
			{"right": false, "character": "Engel", "dialogue": "And you'll tell me the location of the other two sorceress"},
		]
	},
	"alberich": {
		"paimons_gate": [
			{"right": false, "character": "Engel", "dialogue": "Alberich!?"},
			{"right": true, "character": "Alberich", "dialogue": "Engel, you are a great sorcerer..."},
			{"right": true, "character": "Alberich", "dialogue": "The path you choose is not the right one."},
			{"right": false, "character": "Engel", "dialogue": "What are you doing in this place?"},
			{"right": true, "character": "Alberich", "dialogue": "I'm here to persuade you to don't free him"},
			{"right": false, "character": "Engel", "dialogue": "[shake rate=10 level=1]What are you talking about?[/shake]"},
			{"right": false, "character": "Engel", "dialogue": "[shake rate=20 level=5]How is even possible for you to be here?[/shake]"},
			{"right": false, "character": "Engel", "dialogue": "[shake rate=30 level=10]How did you arrive after than me?[/shake]"},
			{"right": true, "character": "Alberich", "dialogue": "It took some days..."},
			{"right": true, "character": "Alberich", "dialogue": "But a powerfull spell brought me here"},
			{"right": false, "character": "Engel", "dialogue": "Days?"},
			{"right": false, "character": "Engel", "dialogue": "I just arrived some minutes ago..."},
			{"right": true, "character": "Alberich", "dialogue": "The time pass slower here..."},
			{"right": true, "character": "Alberich", "dialogue": "Your mother is getting worse..."},
			{"right": true, "character": "Alberich", "dialogue": "You should be with her, on his deathbed."},
			{"right": false, "character": "Engel", "dialogue": "What are you talking about?"},
			{"right": false, "character": "Engel", "dialogue": "[shake rate=30 level=10]!!![/shake]"},
			{"right": false, "character": "Engel", "dialogue": "..."},
			{"right": false, "character": "Engel", "dialogue": "Then..."},
			{"right": false, "character": "Engel", "dialogue": "I don't have no more time to waste..."},
			{"right": false, "character": "Engel", "dialogue": "Get out of my way"},
			{"right": false, "character": "Engel", "dialogue": "I'm going to free Gunther."}
		],
		"defeated": [
			{"right": false, "character": "Engel", "dialogue": "Is defeated"},
			{"right": false, "character": "Engel", "dialogue": "He can't stop me."},
		],
		"stop": [
			{"right": true, "character": "Alberich", "dialogue": "..."},
			{"right": false, "character": "Engel", "dialogue": "I don't have no more time to waste..."},
		]
	},
	"level05": {
		"begin": [
			{"right": true, "character": "Alberich", "dialogue": "I'm sorry but I must to stop you"},
			{"right": false, "character": "Engel", "dialogue": "I beat you recently."},
			{"right": false, "character": "Engel", "dialogue": "You have nothing to do against me."},
		],
		"defeated": [
			{"right": true, "character": "Alberich", "dialogue": "It's time to return..."},
		],
		"winner": [
			{"right": false, "character": "Engel", "dialogue": "You are not a rival for me"},
			{"right": true, "character": "Alberich", "dialogue": "Please don't do it!"}
			#{"right": false, "character": "Engel", "dialogue": "There's no one to stand in my way anymore"},
			#{"right": false, "character": "Engel", "dialogue": "I've made it!"},
		]
	},
	"ui_runes": {
		"rune_a": [
			{"right": false, "character": "Engel", "dialogue": "the rune A"}
		],
		"rune_b": [
			{"right": false, "character": "Engel", "dialogue": "the rune B"}
		],
		"rune_c": [
			{"right": false, "character": "Engel", "dialogue": "the rune C"}
		],
		"rune_d": [
			{"right": false, "character": "Engel", "dialogue": "the rune D"}
		],
		"rune_e": [
			{"right": false, "character": "Engel", "dialogue": "the rune E"}
		],
		"rune_f": [
			{"right": false, "character": "Engel", "dialogue": "the rune F"}
		],
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
	
