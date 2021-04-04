extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
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
