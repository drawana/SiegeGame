extends MarginContainer

const first_scene = preload("res://Scenes/Instructions2.tscn")


func _on_Next_pressed():
	get_parent().add_child(first_scene.instance())
	queue_free()

