extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../TheirHealthBar")
	var level = get_node("../InfantryLevelDisplay").getVal()
	#var animation = 
	
	#if level == 1:
		
	#elif level == 2:
		
	#elif level == 3:
		
	#elif level == 4:
		
	#elif level == 5:
	
	var pointsToNotDecreaseBy = 0
	if get_node("../NextRoundButton").getInfantryDefendEnemy() == true:
		var ourInfantryLevel = int(get_node("../InfantryLevelDisplayEnemy").get_text())
		pointsToNotDecreaseBy = ((ourInfantryLevel * 2) + randi()%5 + (1 * ourInfantryLevel)) * 0.8
	var pointsToDecreaseBy = (level * 2) + randi()%5 + (1 * level) - pointsToNotDecreaseBy
	
	if pointsToDecreaseBy > 0:
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
		
