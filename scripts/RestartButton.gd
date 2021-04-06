extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	var endInf = get_node("../InfantryLevelDisplay").get_text()
	var endArt = get_node("../ArtilleryLevelDisplay").get_text()
	var endNav = get_node("../NavalLevelDisplay").get_text()
	var endDiff = NextRoundButton.difficulty
	var endEnemyCastle = str(get_node("../TheirHealthBar").value)
	var endRound = NextRoundButton.weeks
	
	get_tree().change_scene("res://Scenes/Restart.tscn")
	Restart.diffculty =endDiff
	Restart.rounds =endRound
	Restart.inf =endInf
	Restart.nav  = endNav
	Restart.art  = endArt
	Restart.emHealth  = endEnemyCastle
