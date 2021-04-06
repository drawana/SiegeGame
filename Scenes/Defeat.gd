extends MarginContainer

var nav = 0

func _ready():
	pass

func onDefeat(diff, length, inf, navs, art, emHealth):
	print($Contain/VBoxContainer1/VBoxContainer2/Difficulty.text)
	
	#$MarginContainer/VBoxContainer/VBoxContainer/Difficulty.text = "Difficulty: " + diff
	#$MarginContainer/VBoxContainer/VBoxContainer/Length.text = "Length of Siege: " + str(length) + " Rounds"
	#print("INSIDE", diff, " ", length, " ", inf, " ", nav, " ", art, " ", emHealth)
	#print(get_parent().name)
	#print(get_parent().get_node("Defeat").name)
	#get_parent().get_node(".").get_node()
	#print(get_parent().get_node("Defeat").get_node("Contain").name)
	#print(get_node("MarginContainer/VBoxContainer1/VBoxContainer2").name)
	#print(get_node("MarginContainer/VBoxContainer1/VBoxContainer2/NavLevel").name)
	#var navLevel = get_node("/MarginContainer/VBoxContainer1/VBoxContainer2/NavLevel")
	#navLevel.set_text(str(nav))
	#$MarginContainer/VBoxContainer/VBoxContainer/InfLevel.text = "Infantry Level: " + str(inf)
	#$MarginContainer/VBoxContainer/VBoxContainer/NavLevel.text = "Navy Level: " + str(nav)
	#$MarginContainer/VBoxContainer/VBoxContainer/ArtLevel.text = "Artillery Level: " + str(art)
	#$MarginContainer/VBoxContainer/VBoxContainer/EnemyHP.text = "Enemy Castle Health: " + str(emHealth)
	#$MarginContainer/VBoxContainer/VBoxContainer/NavLevel.text = "Navy Level: " + get_node("../../World/NavalLevelDisplay").get_text()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")
