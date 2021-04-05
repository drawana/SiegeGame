extends TextureButton


func _ready():
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	get_node("../NextRoundButton").setInfantryDefend(true)
	var QuickAttackInfantry = get_node("../QuickAttackInfantry")
	QuickAttackInfantry.visible = false
	
	var DefendInfantry = get_node("../DefendInfantry")
	DefendInfantry.visible = false
	
	var CancelInfantry = get_node("../CancelInfantry")
	CancelInfantry.visible = false
	
	var InvadeInfantry = get_node("../InvadeInfantry")
	InvadeInfantry.visible = false
	
	var level = get_node("../InfantryLevelDisplay").getVal()
	
	get_node("../NextRoundButton").infantrySet()
	
	if level == 1:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1").play("DEFEND GO LEV 1")
	elif level == 2:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 2 - AnimationPlayer - Group2 - 2").play("DEFEND GO LEVEL 2")
	elif level == 3:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 3 - AnimationPlayer - Group2 - 4").play("DEFEND GO LEVEL 3")
	elif level == 4:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("DEFEND GO LEVEL 4")
	elif level == 5:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 5 - AnimationPlayer - Group2 - 3").play("DEFEND LEVEL 5")
	
	yield(get_tree().create_timer(1.9), "timeout")
