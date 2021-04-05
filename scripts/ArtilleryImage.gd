extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
	print("bb", NextRoundButton.artilleryLevel)
	
	if NextRoundButton.artilleryLevel >= 1:
		get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").visible = true
	if NextRoundButton.artilleryLevel >= 2:
		get_parent().get_parent().get_node("game2").get_node("AnimatedSprite2").visible = true
	if NextRoundButton.artilleryLevel >= 3:
		get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").visible = true
		
	if NextRoundButton.usArtLevel >= 1:
			get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").visible = true
	if NextRoundButton.usArtLevel >= 2:
			get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite2").visible = true
	if NextRoundButton.usArtLevel == 3:
			get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite3").visible = true
	
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
