extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	if int(get_node("../NavalLevelDisplay").get_text()) == 0:
		get_node("../NavalImage").visible = false
	
func _on_Button_Pressed():
	if get_node("../NextRoundButton").navalGet() == false:
		var points = get_node("../TheirHealthBar")
		
		var AttackNaval = get_node("../AttackNaval")
		AttackNaval.visible = true
		
		var DefendNaval = get_node("../DefendNaval")
		DefendNaval.visible = true
		
		var CancelNaval = get_node("../CancelNaval")
		CancelNaval.visible = true
	else:
		redAnimation.play("Test")
