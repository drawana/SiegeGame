extends TextureButton

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../PointsCounter")
	var val = int(points.get_text()) 
	if (val >= 15):
		points.set_text(str(val - 15))
	
