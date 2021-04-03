extends TextureButton

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var QuickAttackInfantry = get_node("../QuickAttackInfantry")
	QuickAttackInfantry.visible = true
	
	var DefendInfantry = get_node("../DefendInfantry")
	DefendInfantry.visible = true
	
	var CancelInfantry = get_node("../CancelInfantry")
	CancelInfantry.visible = true
