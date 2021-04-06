extends MarginContainer

var diffculty = "Easy"
var rounds = 0
var inf = 0
var nav = 0
var art = 0
var emHealth = 0

func _ready():
	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")


func _on_StatsButton_pressed():
	$Contain/VBoxContainer1/CenterContainer2.visible = false
	$Contain/VBoxContainer1/VBoxContainer2/Length.text = "Length of Siege " + str(Defeat.rounds)
	$Contain/VBoxContainer1/VBoxContainer2/NavLevel.text = "Naval Level: " + str(Defeat.nav)
	$Contain/VBoxContainer1/VBoxContainer2/Difficulty.text = "Difficulty: " + str(Defeat.diffculty)
	$Contain/VBoxContainer1/VBoxContainer2/InfLevel.text = "Infantry Level: " + str(Defeat.inf)
	$Contain/VBoxContainer1/VBoxContainer2/ArtLevel.text = "Artillery Level: " + str(Defeat.art)
	$Contain/VBoxContainer1/VBoxContainer2/EnemyHP.text = "Enemy Castle Health: " + str(Defeat.emHealth)
	$Contain/VBoxContainer1/VBoxContainer2.visible = true
