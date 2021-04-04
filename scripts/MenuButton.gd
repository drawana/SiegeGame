extends TextureButton
onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var MenuButton = get_node("../MenuButton")
	if MenuButton.disabled == true:
		redAnimation.play("Test")
	else:
		var greyBackground = get_node("../../GreyBackground")
		greyBackground.visible = true
		
		var resume = get_node("../ResumeButton")
		resume.visible = true
		
		var exit = get_node("../ExitButton")
		exit.visible = true
		
		var restart = get_node("../Restart")
		restart.visible = true
		
		var menu = get_node("../MenuButton")
		menu.visible = false
		
		var upgrade = get_node("../UpgradeButton")
		upgrade.visible = false
		
		var nextRound = get_node("../NextRoundButton")
		nextRound.visible = false
		
		var InfantryImage = get_node("../InfantryImage")
		InfantryImage.visible = false
		
		var NavalImage = get_node("../NavalImage")
		NavalImage.visible = false
		
		var ArtilleryImage = get_node("../ArtilleryImage")
		ArtilleryImage.visible = false
		
		var MyHealthBar = get_node("../MyHealthBar")
		MyHealthBar.visible = false
		
		var TheirHealthBar = get_node("../TheirHealthBar")
		TheirHealthBar.visible = false
		
		var InfantryImageEnemy = get_node("../InfantryImageEnemy")
		InfantryImageEnemy.visible = false
			
		var ArtilleryImageEnemy = get_node("../ArtilleryImageEnemy")
		ArtilleryImageEnemy.visible = false
		
		var NavalImageEnemy = get_node("../NavalImageEnemy")
		NavalImageEnemy.visible = false
	
