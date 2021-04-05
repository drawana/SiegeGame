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
	
	var navalLevel = int(get_node("../NavalLevelDisplay").get_text())
	if navalLevel == 1 or navalLevel == 2:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1 - 2 - 2").play("GR2 Ships DEFEND GO Level 1+2")
	if navalLevel == 3 or navalLevel == 4:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1 - 2 - 2").play("GR2 Ships DEFEND GO Level 3+4")
	if navalLevel >= 5:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1 - 2 - 2").play("GR2 Ships DEFEND GO Level 5")
	
	yield(get_tree().create_timer(1), "timeout")
