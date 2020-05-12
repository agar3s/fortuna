extends Control


var index = [
	'Index',
	'KrystinePage',
	'ReynerPage',
	'GenaPage'
]
var current = 'Index'
var current_index = 0

func _ready():
	$Next.connect("button_down", self, 'next_page')
	$Prev.connect("button_down", self, 'prev_page')
	Events.connect("spell_book_pressed", self, "toggle_visibility")

func toggle_visibility():
	visible = !visible


func change_page(page):
	#$CanvasLayer/SpellSealUI.hide()
	$Pages.get_node(current).hide()
	current = page
	$Pages.get_node(page).show()


func next_page():
	current_index += 1
	if current_index >= index.size():
		current_index = index.size() - 1
		
	var target_page = index[current_index]
	change_page(target_page)


func prev_page():
	current_index -= 1
	if current_index < 0:
		current_index = 0
		
	var target_page = index[current_index]
	change_page(target_page)

