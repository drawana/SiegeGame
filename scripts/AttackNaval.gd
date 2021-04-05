extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../TheirHealthBar")
	
	var level = get_node("../NavalLevelDisplay").getVal()
	var pointsToNotDecreaseBy = 0
	if get_node("../NextRoundButton").getNavalDefendEnemy() == true:
		var ourNavalLevel = int(get_node("../NavalLevelDisplayEnemy").get_text())
		pointsToNotDecreaseBy = ((ourNavalLevel * 2) + randi()%5 + (1 * ourNavalLevel)) * 0.8
	var pointsToDecreaseBy = (level * 4) + randi()%10 + (1 * level) - pointsToNotDecreaseBy
	
	if pointsToDecreaseBy > 0:
		get_node("../TheirHealthBar").set_value(points.value - pointsToDecreaseBy)
	
	greenAnimation.play("Test")
	
	var AttackNaval = get_node("../AttackNaval")
	AttackNaval.visible = false
	
	var DefendNaval = get_node("../DefendNaval")
	DefendNaval.visible = false
	
	var CancelNaval = get_node("../CancelNaval")
	CancelNaval.visible = false
	
	get_node("../NextRoundButton").navalSet()
		
