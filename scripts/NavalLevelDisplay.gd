extends Label

var defending = false

func _ready():
	updateVal()
	
func updateVal():
	get_node("../NavalLevel").set_text(str(NextRoundButton.usNavLevel))
	get_node("../NavalLevelDisplay").set_text(str(NextRoundButton.usNavLevel))
	
	
	#if NextRoundButton.usNavLevel >= 1:
	#	get_node("../group 2 - ships/Sprite").visible = true
	#if NextRoundButton.usNavLevel >= 2:
#	get_node("../group 2 - ships2/Sprite").visible = true
	#if NextRoundButton.usNavLevel == 3:
	#	get_node("../group 2 - ships3/Sprite").visible = true

func getVal():
	return int(get_node("../NavalLevelDisplay").get_text())

func getDefend():
	return defending

func setDefend(param):
	defending = param
