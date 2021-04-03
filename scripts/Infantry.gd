extends TextureButton

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../PointsCounter")
	var val = int(points.get_text()) 
	if (val >= 10):
		points.set_text(str(val - 10))
		var points2 = get_node("../InfantryLevel")
		var val2 = int(points2.get_text()) 
		points2.set_text(str(val2 + 1))
