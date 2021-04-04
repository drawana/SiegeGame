extends Label

var level = 0

func _ready():
	var level = get_node("../NextRoundButton").getInfantryLevel()
	setVal(level)

func getVal():
	return level
	
func setVal(param):
	level = param
	get_node("../InfantryLevelDisplayEnemy").set_text(str(level))
