extends TextureButton

func _ready():
		
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	var greyBackground = get_node("../../GreyBackground")
	greyBackground.visible = false
	
	var resume = get_node("../ResumeButton")
	resume.visible = false
	
	var exit = get_node("../ExitButton")
	exit.visible = false
	
	var restart = get_node("../Restart")
	restart.visible = false
	
	var menu = get_node("../MenuButton")
	menu.visible = true
	
	var upgrade = get_node("../UpgradeButton")
	upgrade.visible = true
	
	var nextRound = get_node("../NextRoundButton")
	nextRound.visible = true
