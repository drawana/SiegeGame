extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var upgradeCheck = get_node("../UpgradeButton")
	if upgradeCheck.disabled == true:
		redAnimation.play("Test")
	else:
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
		
		var navalLevel = get_node("../NavalLevel")
		navalLevel.visible = true
		
		var infantryLevel = get_node("../InfantryLevel")
		infantryLevel.visible = true
		
		var artilleryLevel = get_node("../ArtilleryLevel")
		artilleryLevel.visible = true
		
		var labelNaval = get_node("../LabelNaval")
		labelNaval.visible = true
		
		var labelInfantry = get_node("../LabelInfantry")
		labelInfantry.visible = true
		
		var labelArtillery = get_node("../LabelArtillery")
		labelArtillery.visible = true
		
		var menu = get_node("../MenuButton")
		menu.visible = false
		
		var upgrade = get_node("../UpgradeButton")
		upgrade.visible = false
		
		var nextRound = get_node("../NextRoundButton")
		nextRound.visible = false
		
		var InfantryImage = get_node("../InfantryImage")
		InfantryImage.visible = false
		
		var ArtilleryImage = get_node("../ArtilleryImage")
		ArtilleryImage.visible = false
		
		var NavalImage = get_node("../NavalImage")
		NavalImage.visible = false
		
		var MyHealthBar = get_node("../MyHealthBar")
		MyHealthBar.visible = false
		
		var TheirHealthBar = get_node("../TheirHealthBar")
		TheirHealthBar.visible = false
		
