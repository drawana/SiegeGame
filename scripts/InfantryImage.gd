extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	if int(get_node("../InfantryLevelDisplay").get_text()) == 0:
		get_node("../InfantryImage").visible = false
	
func _on_Button_Pressed():
	if get_node("../NextRoundButton").infantryGet() == false:
		var points = get_node("../TheirHealthBar")
		if points.value <= 0:
			var InvadeInfantry = get_node("../InvadeInfantry")
			InvadeInfantry.visible = true
		
		var QuickAttackInfantry = get_node("../QuickAttackInfantry")
		QuickAttackInfantry.visible = true
		
		var DefendInfantry = get_node("../DefendInfantry")
		DefendInfantry.visible = true
		
		var CancelInfantry = get_node("../CancelInfantry")
		CancelInfantry.visible = true
	else:
		redAnimation.play("Test")
