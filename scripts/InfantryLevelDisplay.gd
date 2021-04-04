extends Label


func _ready():
	var points = get_node("../InfantryLevel")
	var val = int(points.get_text()) 
	var curr = get_node("../InfantryLevelDisplay").set_text(str(val))
