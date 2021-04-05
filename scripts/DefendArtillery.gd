extends TextureButton


func _ready():
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	get_node("../NextRoundButton").setArtilleryDefend(true)
	var BigAttackArtillery = get_node("../BigAttackArtillery")
	BigAttackArtillery.visible = false
	
	var DefendArtillery = get_node("../DefendArtillery")
	DefendArtillery.visible = false
	
	var CancelArtillery = get_node("../CancelArtillery")
	CancelArtillery.visible = false
	
	get_node("../NextRoundButton").artillerySet()
	
	var level = get_node("../ArtilleryLevelDisplay").getVal()
	
	var artilleryLevel = int(get_node("../ArtilleryLevelDisplay").get_text())
	if artilleryLevel == 1 or artilleryLevel == 2:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1 - 2").play("GR2 Cannonss DEFEND GO Level 1+2")
	if artilleryLevel == 3 or artilleryLevel == 4:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1 - 2").play("GR2 Cannonss DEFEND GO Level 3+4")
	if artilleryLevel >= 5:
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1 - 2").play("GR2 Cannonss DEFEND GO Level 5")
	
	yield(get_tree().create_timer(1), "timeout")
