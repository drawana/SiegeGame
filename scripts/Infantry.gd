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
		var InfantryLevelDisplay = get_node("../InfantryLevelDisplay")
		InfantryLevelDisplay.set_text(str(val2 + 1))
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
		
		var points3 = int(get_node("../InfantryLevel").get_text())
		if points3 >= 5:
			get_node("../Infantry").disabled = true
			
		if points3 >= 1:
			get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1").get_node("Sprite").visible = true
		if points3 >= 2:
			get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 2 - AnimationPlayer - Group2 - 2").get_node("Sprite").visible = true
		if points3 >= 3:
			get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 3 - AnimationPlayer - Group2 - 4").get_node("Sprite").visible = true
		if points3 >= 4:
			get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").get_node("Sprite").visible = true
		if points3 >= 5:
			get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 5 - AnimationPlayer - Group2 - 3").get_node("Sprite").visible = true
			
			
	else:
		redAnimation.play("Test")
