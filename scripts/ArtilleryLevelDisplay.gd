extends Label

var defending = false

func _ready():
	updateVal()

func updateVal():
	get_node("../ArtilleryLevel").set_text(str(NextRoundButton.usArtLevel))
	get_node("../ArtilleryLevelDisplay").set_text(str(NextRoundButton.usArtLevel))
	
	#if NextRoundButton.usArtLevel >= 1:
	#	get_node("../CANNON GROUP 2 AnimatedSprite1").visible = true
	#if NextRoundButton.usArtLevel >= 2:
#		get_node("../CANNON GROUP 2 AnimatedSprite2").visible = true
#	if NextRoundButton.usArtLevel == 3:
#		get_node("../CANNON GROUP 2 AnimatedSprite3").visible = true

func getVal():
	return int(get_node("../ArtilleryLevelDisplay").get_text())

func getDefend():
	return defending

func setDefend(param):
	defending = param
