extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
	var naval = get_node("../NavalLevelDisplayEnemy")
	naval.set_text(str(NextRoundButton.navalLevel))
	
	if NextRoundButton.usNavLevel == 0:
		get_node("../NavalImage").visible = false
	if NextRoundButton.navalLevel == 0:
		get_node("../NavalImageEnemy").visible = false

	if NextRoundButton.navalLevel >= 1:
		get_parent().get_parent().get_node("game2").get_node("group 1 - ships6").get_node("Sprite").visible = true
	if NextRoundButton.navalLevel >= 3:
		get_parent().get_parent().get_node("game2").get_node("group 1 - ships5").get_node("Sprite").visible = true

	if NextRoundButton.usNavLevel >= 1:
		get_parent().get_parent().get_node("game2").get_node("group 2 - ships").get_node("Sprite").visible = true
	if NextRoundButton.usNavLevel == 3:
		get_parent().get_parent().get_node("game2").get_node("group 2 - ships2").get_node("Sprite").visible = true

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
