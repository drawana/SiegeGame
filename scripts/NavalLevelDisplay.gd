extends Label

func _ready():
	var points = get_node("../NavalLevel")
	var val = int(points.get_text()) 
	var curr = get_node("../NavalLevelDisplay").set_text(str(val))
