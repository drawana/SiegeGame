extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var points = get_node("../TheirHealthBar")
	
	var level = get_node("../ArtilleryLevelDisplay").getVal()
	var pointsToDecreaseBy = (level * 3) + randi()%20 + (1 * level)
	
	get_node("../TheirHealthBar").set_value(points.value - pointsToDecreaseBy)
	greenAnimation.play("Test")
	
	var BigAttackArtillery = get_node("../BigAttackArtillery")
	BigAttackArtillery.visible = false
	
	var DefendArtillery = get_node("../DefendArtillery")
	DefendArtillery.visible = false
	
	var CancelArtillery = get_node("../CancelArtillery")
	CancelArtillery.visible = false
	
	get_node("../NextRoundButton").artillerySet()
		
