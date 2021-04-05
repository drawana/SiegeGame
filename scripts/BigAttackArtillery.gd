extends TextureButton

onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	var level = get_node("../ArtilleryLevelDisplay").getVal()
	
	if level == 1 or level == 2:
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").playing = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").get_node("group2 - fireball4").visible = true
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("LEVEL 1 - Cannon Group2")
	if level == 3 or level == 4:
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").playing = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite2").playing = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").get_node("group2 - fireball4").visible = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite2").get_node("group2 - fireball5").visible = true
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("LEVEL 3 + 4 - Cannon Group 2")
	if level >= 5:
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").playing = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite2").playing = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite3").playing = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").get_node("group2 - fireball4").visible = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite2").get_node("group2 - fireball5").visible = true
		get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite3").get_node("group2 - fireball7").visible = true
		get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("LEVEL 5 - Cannon Group 2")
	
	greenAnimation.play("Test")
	
	var BigAttackArtillery = get_node("../BigAttackArtillery")
	BigAttackArtillery.visible = false
	
	var DefendArtillery = get_node("../DefendArtillery")
	DefendArtillery.visible = false
	
	var CancelArtillery = get_node("../CancelArtillery")
	CancelArtillery.visible = false
	
	get_node("../NextRoundButton").artillerySet()
	
	yield(get_tree().create_timer(.9), "timeout")
	get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").playing = false
	get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite2").playing = false
	get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite3").playing = false
	
	yield(get_tree().create_timer(1.8), "timeout")
	get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite1").get_node("group2 - fireball4").visible = false
	get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite2").get_node("group2 - fireball5").visible = false
	get_parent().get_parent().get_node("game2").get_node("CANNON GROUP 2 AnimatedSprite3").get_node("group2 - fireball7").visible = false
	
	var points = get_node("../TheirHealthBar")
	var pointsToNotDecreaseBy = 0
	if get_node("../NextRoundButton").getArtilleryDefendEnemy() == true:
		var ourArtilleryLevel = int(get_node("../ArtilleryLevelDisplayEnemy").get_text())
		pointsToNotDecreaseBy = ((ourArtilleryLevel * 2) + randi()%5 + (1 * ourArtilleryLevel)) * 0.8
	var pointsToDecreaseBy = (level * 3) + randi()%20 + (1 * level) - pointsToNotDecreaseBy
	
	if pointsToDecreaseBy > 0:
		get_node("../NextRoundButton").addDamage(pointsToDecreaseBy)
		#NextRoundButton.totalDamageEnemy += pointsToDecreaseBy
		get_node("../TheirHealthBar").set_value(points.value - pointsToDecreaseBy)

		
