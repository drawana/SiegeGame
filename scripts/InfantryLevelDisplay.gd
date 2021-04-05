extends Label

var defending = false

func _ready():
	updateVal()

func updateVal():
	get_node("../InfantryLevel").set_text(str(NextRoundButton.usInfLevel))
	get_node("../InfantryLevelDisplay").set_text(str(NextRoundButton.usInfLevel))
	
	#if NextRoundButton.usInfLevel >= 1:
	#	get_node("../PPL LEVEL 1 - AnimationPlayer - Group2 - 1").visible = true
	#if NextRoundButton.usInfLevel >= 2:
#		get_node("../PPL LEVEL 2 - AnimationPlayer - Group2 - 2").visible = true
#	if NextRoundButton.usInfLevel == 3:
#		get_node("../PPL LEVEL 3 - AnimationPlayer - Group2 - 4").visible = true

func getVal():
	return int(get_node("../InfantryLevelDisplay").get_text())

func getDefend():
	return defending

func setDefend(param):
	defending = param
