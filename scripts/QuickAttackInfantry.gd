extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../TheirHealthBar")
	
	var level = get_node("../InfantryLevelDisplay").getVal()
	var pointsToDecreaseBy = (level * 2) + randi()%(level * 10) + 1
	
	get_node("../TheirHealthBar").set_value(points.value - pointsToDecreaseBy)
	greenAnimation.play("Test")
	
	var QuickAttackInfantry = get_node("../QuickAttackInfantry")
	QuickAttackInfantry.visible = false
	
	var DefendInfantry = get_node("../DefendInfantry")
	DefendInfantry.visible = false
	
	var CancelInfantry = get_node("../CancelInfantry")
	CancelInfantry.visible = false
	
	var InvadeInfantry = get_node("../InvadeInfantry")
	InvadeInfantry.visible = false
	
	get_node("../NextRoundButton").infantrySet()
		
