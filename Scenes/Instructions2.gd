extends MarginContainer

#onready var first_scene = preload("res://Scenes/TitleMenu.gd")

func _on_Next_pressed():
	#get_parent().add_child(first_scene.instance())
	#queue_free()
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")
