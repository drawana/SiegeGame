extends TextureButton

func _ready():
		
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	var QuickAttackInfantry = get_node("../QuickAttackInfantry")
	QuickAttackInfantry.visible = false
	
	var DefendInfantry = get_node("../DefendInfantry")
	DefendInfantry.visible = false
	
	var CancelInfantry = get_node("../CancelInfantry")
	CancelInfantry.visible = false
	
	var InvadeInfantry = get_node("../InvadeInfantry")
	InvadeInfantry.visible = false
