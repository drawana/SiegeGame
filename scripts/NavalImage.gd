extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
	if int(get_node("../NavalLevelDisplay").get_text()) == 0:
		get_node("../NavalImage").visible = false
	if int(get_node("../NavalLevelDisplayEnemy").get_text()) == 0:
		get_node("../NavalImageEnemy").visible = false
		
	if NextRoundButton.usNavLevel >= 1:
		print(get_parent().get_parent().get_node("game2").get_node("group 2 - ships").name)
		get_parent().get_parent().get_node("game2").get_node("group 2 - ships").get_node("Sprite").visible = true
		#get_parent().get_parent().get_node("game2").get_node("group2 - fireball").visible = true #might need this
	if NextRoundButton.usNavLevel >= 2:
		get_parent().get_parent().get_node("game2").get_node("group 2 - ships2").get_node("Sprite").visible = true
		#get_parent().get_parent().get_node("game2").get_node("group2 - fireball2").visible = true #might need this
	if NextRoundButton.usNavLevel == 3:
		get_parent().get_parent().get_node("game2").get_node("group 2 - ships3").get_node("Sprite").visible = true
		#get_parent().get_parent().get_node("game2").get_node("group2 - fireball3").visible = true #might need this
	
func _on_Button_Pressed():
	if get_node("../NextRoundButton").navalGet() == false:
		var points = get_node("../TheirHealthBar")
		
		var AttackNaval = get_node("../AttackNaval")
		AttackNaval.visible = true
		
		var DefendNaval = get_node("../DefendNaval")
		DefendNaval.visible = true
		
		var CancelNaval = get_node("../CancelNaval")
		CancelNaval.visible = true
	else:
		redAnimation.play("Test")
