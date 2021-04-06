extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
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
	
	var endInf = get_node("../InfantryLevelDisplay").get_text()
	var endArt = get_node("../ArtilleryLevelDisplay").get_text()
	var endNav = get_node("../NavalLevelDisplay").get_text()
	var endDiff = NextRoundButton.difficulty
	var endEnemyCastle = str(get_node("../TheirHealthBar").value)
	var endRound = NextRoundButton.weeks
	
	get_tree().change_scene("res://Scenes/Victory.tscn")
	Victory.diffculty =endDiff
	Victory.rounds =endRound
	Victory.inf =endInf
	Victory.nav  = endNav
	Victory.art  = endArt
	Victory.emHealth  = endEnemyCastle
		
