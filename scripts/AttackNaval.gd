extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../TheirHealthBar")
	
	var level = get_node("../NavalLevelDisplay").getVal()
	
	if level == 1 or level == 2:
		get_parent().get_parent().get_node("game2").get_node("group2 - fireball3").visible = true
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("SHIP LEVEL 1 + 2 - group 2 fireball")
	if level == 3 or level == 4:
		get_parent().get_parent().get_node("game2").get_node("group2 - fireball3").visible = true
		get_parent().get_parent().get_node("game2").get_node("group2 - fireball2").visible = true
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("SHIP LEVEL 3 - group 2 fireball")
	if level >= 5:
		get_parent().get_parent().get_node("game2").get_node("group2 - fireball").visible = true
		get_parent().get_parent().get_node("game2").get_node("group2 - fireball2").visible = true
		get_parent().get_parent().get_node("game2").get_node("group2 - fireball3").visible = true
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("ship LEVEL 5 - group 2")
	
	greenAnimation.play("Test")
	
	var AttackNaval = get_node("../AttackNaval")
	AttackNaval.visible = false
	
	var DefendNaval = get_node("../DefendNaval")
	DefendNaval.visible = false
	
	var CancelNaval = get_node("../CancelNaval")
	CancelNaval.visible = false
	
	get_node("../NextRoundButton").navalSet()
	
	yield(get_tree().create_timer(2.4), "timeout")
	get_parent().get_parent().get_node("game2").get_node("group2 - fireball").visible = false
	get_parent().get_parent().get_node("game2").get_node("group2 - fireball2").visible = false
	get_parent().get_parent().get_node("game2").get_node("group2 - fireball3").visible = false
	
	var pointsToNotDecreaseBy = 0
	if get_node("../NextRoundButton").getNavalDefendEnemy() == true:
		var ourNavalLevel = int(get_node("../NavalLevelDisplayEnemy").get_text())
		pointsToNotDecreaseBy = ((ourNavalLevel * 2) + randi()%5 + (1 * ourNavalLevel)) * 0.8
	var pointsToDecreaseBy = (level * 4) + randi()%10 + (1 * level) - pointsToNotDecreaseBy
	
	if pointsToDecreaseBy > 0:
		get_node("../TheirHealthBar").set_value(points.value - pointsToDecreaseBy)

		
