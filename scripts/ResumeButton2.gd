extends TextureButton

func _ready():
		
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	var greyBackground = get_node("../../GreyBackground")
	greyBackground.visible = false
	
	var resume = get_node("../ResumeButton2")
	resume.visible = false
	
	var menu = get_node("../MenuButton")
	menu.visible = true
	
	var upgrade = get_node("../UpgradeButton")
	upgrade.visible = true
	
	var nextRound = get_node("../NextRoundButton")
	nextRound.visible = true
	
	var infantry = get_node("../Infantry")
	infantry.visible = false
	
	var artillery = get_node("../Artillery")
	artillery.visible = false
	
	var naval = get_node("../Naval")
	naval.visible = false
	
	var points = get_node("../PointsCounter")
	var val = int(points.get_text()) 
	
	if (val >= 15):
		var upgradeAvaliable = get_node("../UpgradeAvaliable2")
		upgradeAvaliable.visible = true
		
		var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
		upgradeAvaliable2.visible = false
	elif(val >= 10):
		var upgradeAvaliable = get_node("../UpgradeAvaliable2")
		upgradeAvaliable.visible = false
		
		var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
		upgradeAvaliable2.visible = true
	else:
		var upgradeAvaliable = get_node("../UpgradeAvaliable2")
		upgradeAvaliable.visible = false
		
		var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
		upgradeAvaliable2.visible = false
