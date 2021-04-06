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


func _on_stat_pressed():
	$MarginContainer/VBoxContainer/Stats.visible = false
	$MarginContainer/VBoxContainer/VBoxContainer/Length.text = "Length of Siege " + str(Restart.rounds)
	$MarginContainer/VBoxContainer/VBoxContainer/NavLevel.text = "Naval Level: " + str(Restart.nav)
	$MarginContainer/VBoxContainer/VBoxContainer/Difficulty.text = "Difficulty: " + str(Restart.diffculty)
	$MarginContainer/VBoxContainer/VBoxContainer/InfLevel.text = "Infantry Level: " + str(Restart.inf)
	$MarginContainer/VBoxContainer/VBoxContainer/ArtLevel.text = "Artillery Level: " + str(Restart.art)
	$MarginContainer/VBoxContainer/VBoxContainer/EnemyHP.text = "Enemy Castle Health: " + str(Restart.emHealth)
	$MarginContainer/VBoxContainer/VBoxContainer.visible = true
