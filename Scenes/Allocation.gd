extends MarginContainer

onready var points = 3
onready var infLevel = 0
onready var navLevel = 0
onready var artLevel = 0
onready var difficulty = "Easy"
#var next_scene = preload("res://Scenes/World.tscn").instance()

#func _ready():
	#print('ready')

func getDiff():
	return difficulty

func getInf():
	return infLevel

func getNav():
	return navLevel
	
func getArt():
	return artLevel

func _on_UpgradeNav_pressed():
	if points >= 1:
		points -= 1
		navLevel +=1 
		$CenterContainer/VBoxContainer/CenterContainer2/Label.text = "Points Available: " + str(points)
		$CenterContainer/VBoxContainer/CenterContainer4/HBoxContainer/CenterContainer2/Label.text = "Level: " + str(navLevel)


func _on_UpgradeArt_pressed():
	if points >= 1:
		points -= 1
		artLevel +=1 
		$CenterContainer/VBoxContainer/CenterContainer2/Label.text = "Points Available: " + str(points)
		$CenterContainer/VBoxContainer/CenterContainer4/HBoxContainer/CenterContainer3/Label.text = "Level: " + str(artLevel)


func _on_UpgradeInf_pressed():
	if points >= 1:
		points -= 1
		infLevel +=1 
		$CenterContainer/VBoxContainer/CenterContainer2/Label.text = "Points Available: " + str(points)
		$CenterContainer/VBoxContainer/CenterContainer4/HBoxContainer/CenterContainer/Label.text = "Level: " + str(infLevel)


func _on_DifficultyButton_pressed():
	if difficulty == "Easy":
		 difficulty = "Medium"
	elif difficulty == "Medium": 
		difficulty = "Hard"
	elif difficulty == "Hard": 
		difficulty = "Easy"
	$CenterContainer/VBoxContainer/CenterContainer5/HBoxContainer/DifficultyButton/DifficultyLabel.text = difficulty
	


func _on_PlayButton_pressed():
	if points < 1:
		#get_tree().get_root().add_child(next_scene)
		#get_parent().add_child(next_scene)
		#next_scene.startDifficulty(difficulty, infLevel, navLevel, artLevel)
		#get_tree().change_scene("res://Scenes/World.tscn")
		NextRoundButton.difficulty = difficulty
		NextRoundButton.usInfLevel = infLevel
		NextRoundButton.usNavLevel = navLevel
		NextRoundButton.usArtLevel = artLevel
		get_tree().change_scene("res://Scenes/World.tscn")
		#queue_free()
