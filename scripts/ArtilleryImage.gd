extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	if int(get_node("../ArtilleryLevelDisplay").get_text()) == 0:
		get_node("../ArtilleryImage").visible = false
	if int(get_node("../ArtilleryLevelDisplayEnemy").get_text()) == 0:
		get_node("../ArtilleryImageEnemy").visible = false
		
	if NextRoundButton.usArtLevel >= 1:
		get_node("../CANNON GROUP 2 AnimatedSprite1").visible = true
	if NextRoundButton.usArtLevel >= 2:
		get_node("../CANNON GROUP 2 AnimatedSprite2").visible = true
	if NextRoundButton.usArtLevel == 3:
		get_node("../CANNON GROUP 2 AnimatedSprite3").visible = true
	
func _on_Button_Pressed():
	if get_node("../NextRoundButton").artilleryGet() == false:
		var BigAttackArtillery = get_node("../BigAttackArtillery")
		BigAttackArtillery.visible = true
		
		var DefendArtillery = get_node("../DefendArtillery")
		DefendArtillery.visible = true
		
		var CancelArtillery = get_node("../CancelArtillery")
		CancelArtillery.visible = true
	else:
		redAnimation.play("Test")
