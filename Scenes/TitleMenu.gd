extends MarginContainer

const first_scene = preload("res://Scenes/Allocation.tscn")
const instructions = preload("res://Scenes/Instructions.tscn")


func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene("res://Scenes/Allocation.tscn")
	elif _current_selection == 1:
		get_tree().change_scene("res://Scenes/Instructions.tscn")
	elif _current_selection == 2:
		get_tree().quit()
		


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Allocation.tscn")


func _on_Instructions_pressed():
	get_tree().change_scene("res://Scenes/Instructions.tscn")
	


func _on_Exit_pressed():
	get_tree().quit()
