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


func _on_Stats_Button_pressed():
	$MarginContainer/VBoxContainer/Stats.visible = false
	$MarginContainer/VBoxContainer/VBoxContainer/Length.text = "Length of Siege " + str(Victory.rounds)
	$MarginContainer/VBoxContainer/VBoxContainer/NavLevel.text = "Naval Level: " + str(Victory.nav)
	$MarginContainer/VBoxContainer/VBoxContainer/Difficulty.text = "Difficulty: " + str(Victory.diffculty)
	$MarginContainer/VBoxContainer/VBoxContainer/InfLevel.text = "Infantry Level: " + str(Victory.inf)
	$MarginContainer/VBoxContainer/VBoxContainer/ArtLevel.text = "Artillery Level: " + str(Victory.art)
	$MarginContainer/VBoxContainer/VBoxContainer/EnemyHP.text = "Enemy Castle Health: " + str(Victory.emHealth)
	$MarginContainer/VBoxContainer/VBoxContainer.visible = true
