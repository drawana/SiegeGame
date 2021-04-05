extends MarginContainer

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$MarginContainer/VBoxContainer/VBoxContainer/Difficulty.text = "Difficulty: " + NextRoundButton.difficulty
	$MarginContainer/VBoxContainer/VBoxContainer/Length.text = "Length of Siege: " + str(NextRoundButton.weeks) + " Rounds"
	$MarginContainer/VBoxContainer/VBoxContainer/InfLevel.text = "Infantry Level: " + str(NextRoundButton.endInf)
	$MarginContainer/VBoxContainer/VBoxContainer/NavLevel.text = "Navy Level: " + str(NextRoundButton.endNav)
	$MarginContainer/VBoxContainer/VBoxContainer/ArtLevel.text = "Artillery Level: " + str(NextRoundButton.endArt)
	$MarginContainer/VBoxContainer/VBoxContainer/EnemyHP.text = "Enemy Castle Health: " + str(NextRoundButton.endEnemyCastle)
	#$MarginContainer/VBoxContainer/VBoxContainer/NavLevel.text = "Navy Level: " + get_node("../../World/NavalLevelDisplay").get_text()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")
