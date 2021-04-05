extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../PointsCounter")
	var val = int(points.get_text()) 
	if (val >= 15):
		points.set_text(str(val - 15))
		var points2 = get_node("../NavalLevel")
		var val2 = int(points2.get_text()) 
		points2.set_text(str(val2 + 1))
		greenAnimation.play("Test")
		var NavalLevelDisplay = get_node("../NavalLevelDisplay")
		NavalLevelDisplay.set_text(str(val2 + 1))
		val2 = int(get_node("../PointsCounter").get_text()) 
		
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
			
		var points3 = int(get_node("../NavalLevel").get_text())
		if points3 >= 5:
			get_node("../Naval").disabled = true
			
		if points3 >= 1:
			get_parent().get_parent().get_node("game2").get_node("group 2 - ships").get_node("Sprite").visible = true
		if points3 >= 3:
			get_parent().get_parent().get_node("game2").get_node("group 2 - ships2").get_node("Sprite").visible = true
		if points3 == 5:
			get_parent().get_parent().get_node("game2").get_node("group 2 - ships3").get_node("Sprite").visible = true
			
	else:
		redAnimation.play("Test")
