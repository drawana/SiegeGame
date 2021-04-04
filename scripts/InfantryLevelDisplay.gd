extends Label

var defending = false

func _ready():
	updateVal()

func updateVal():
	var points = get_node("../InfantryLevel")
	var val = int(points.get_text()) 
	var curr = get_node("../InfantryLevelDisplay").set_text(str(val))

func getVal():
	return int(get_node("../InfantryLevelDisplay").get_text())

func getDefend():
	return defending

func setDefend(param):
	defending = param