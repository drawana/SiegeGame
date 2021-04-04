extends Label


func _ready():
	var points = get_node("../ArtilleryLevel")
	var val = int(points.get_text()) 
	var curr = get_node("../ArtilleryLevelDisplay").set_text(str(val))
	
