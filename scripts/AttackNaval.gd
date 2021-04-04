extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../TheirHealthBar")
	get_node("../TheirHealthBar").set_value(points.value - 50)
	greenAnimation.play("Test")
	
	var AttackNaval = get_node("../AttackNaval")
	AttackNaval.visible = false
	
	var DefendNaval = get_node("../DefendNaval")
	DefendNaval.visible = false
	
	var CancelNaval = get_node("../CancelNaval")
	CancelNaval.visible = false
	
	get_node("../NextRoundButton").navalSet()
		
