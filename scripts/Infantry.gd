extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

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
		greenAnimation.play("Test")
		get_node("../InfantryLevelDisplay").updateVal()
		val2 = int(get_node("../PointsCounter").get_text()) 
		
		if int(get_node("../InfantryLevelDisplay").get_text()) != 0:
			get_node("../InfantryImage").visible = true
		
		if int(get_node("../InfantryLevelDisplayEnemy").get_text()) != 0:
			get_node("../InfantryImageEnemy").visible = true
		
		if (val2 >= 15):
			var upgradeAvaliable = get_node("../UpgradeAvaliable2")
			upgradeAvaliable.visible = true
			
			var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
			upgradeAvaliable2.visible = false
		elif(val2 >= 10):
			var upgradeAvaliable = get_node("../UpgradeAvaliable2")
			upgradeAvaliable.visible = false
			
			var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
			upgradeAvaliable2.visible = true
		else:
			var upgradeAvaliable = get_node("../UpgradeAvaliable2")
			upgradeAvaliable.visible = false
			
			var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
			upgradeAvaliable2.visible = false
		
		var points3 = int(get_node("../InfantryLevel").get_text())
		if points3 >= 5:
			get_node("../Infantry").disabled = true
			
	else:
		redAnimation.play("Test")
