extends TextureButton

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed(): 
	var points = get_node("../PointsCounter")
	var val = int(points.get_text()) 
	points.set_text(str(val + 1))
	
	if (val + 1 >= 15):
		var upgradeAvaliable = get_node("../UpgradeAvaliable2")
		upgradeAvaliable.visible = true
		
		var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
		upgradeAvaliable2.visible = false
	elif(val + 1 >= 10):
		var upgradeAvaliable = get_node("../UpgradeAvaliable2")
		upgradeAvaliable.visible = false
		
		var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
		upgradeAvaliable2.visible = true
	else:
		var upgradeAvaliable = get_node("../UpgradeAvaliable2")
		upgradeAvaliable.visible = false
		
		var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
		upgradeAvaliable2.visible = false
