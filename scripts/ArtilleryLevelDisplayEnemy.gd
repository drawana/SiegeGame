extends Label

var level = 0

func _ready():
	setVal(1)

func getVal():
	return level
	
func setVal(param):
	level = param
	get_node("../ArtilleryLevelDisplayEnemy").set_text(str(level))
