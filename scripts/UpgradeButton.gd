extends TextureButton

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var greyBackground = get_node("../../GreyBackground")
	greyBackground.visible = true
	
	var resume = get_node("../ResumeButton2")
	resume.visible = true
	
	var infantry = get_node("../Infantry")
	infantry.visible = true
	
	var artillery = get_node("../Artillery")
	artillery.visible = true
	
	var naval = get_node("../Naval")
	naval.visible = true
	
	var menu = get_node("../MenuButton")
	menu.visible = false
	
	var upgrade = get_node("../UpgradeButton")
	upgrade.visible = false
	
	var nextRound = get_node("../NextRoundButton")
	nextRound.visible = false
	
