extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../TheirHealthBar")
	var level = get_node("../InfantryLevelDisplay").getVal()
	
	if level == 1:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1").play("group2_walking")
	elif level == 2:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 2 - AnimationPlayer - Group2 - 2").play("group2_walking")
	elif level == 3:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 3 - AnimationPlayer - Group2 - 4").play("group 2 attach")
	elif level == 4:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("group2_walking")
	elif level == 5:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 5 - AnimationPlayer - Group2 - 3").play("group2_walking")
	
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
	
	yield(get_tree().create_timer(4), "timeout")
	
	var pointsToNotDecreaseBy = 0
	if get_node("../NextRoundButton").getInfantryDefendEnemy() == true:
		var ourInfantryLevel = int(get_node("../InfantryLevelDisplayEnemy").get_text())
		pointsToNotDecreaseBy = ((ourInfantryLevel * 2) + randi()%5 + (1 * ourInfantryLevel)) * 0.8
	var pointsToDecreaseBy = (level * 2) + randi()%5 + (1 * level) - pointsToNotDecreaseBy
	
	if pointsToDecreaseBy > 0:
		get_node("../NextRoundButton").addDamage(pointsToDecreaseBy)
		get_node("../TheirHealthBar").set_value(points.value - pointsToDecreaseBy)
	
		
