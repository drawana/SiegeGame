extends TextureButton


func _ready():
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	get_node("../NextRoundButton").setNavalDefend(true)
	var AttackNaval = get_node("../AttackNaval")
	AttackNaval.visible = false
	
	var DefendNaval = get_node("../DefendNaval")
	DefendNaval.visible = false
	
	var CancelNaval = get_node("../CancelNaval")
	CancelNaval.visible = false
	
	get_node("../NextRoundButton").navalSet()
