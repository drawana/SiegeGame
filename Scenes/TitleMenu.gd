extends MarginContainer

const first_scene = preload("res://Scenes/Allocation.tscn")
const instructions = preload("res://Scenes/Instructions.tscn")

onready var selector1 = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector2 = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector3 = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector
var current_selection = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene("res://Scenes/Allocation.tscn")
	elif _current_selection == 1:
		get_tree().change_scene("res://Scenes/Instructions.tscn")
	elif _current_selection == 2:
		get_tree().quit()

func set_current_selection(_current_selection):
	selector1.text = ""
	selector2.text = ""
	selector3.text = ""
	if _current_selection == 0:
		selector1.text = ">"
	elif _current_selection == 1:
		selector2.text = ">"
	elif _current_selection == 2:
		selector3.text = ">"
