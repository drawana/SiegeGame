extends TextureButton

var infantryDone = false
var navalDone = false
var artilleryDone = false
onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation
var difficulty = "Easy"
var navalLevel = 0
var artilleryLevel = 0
var infantryLevel = 0
var usInfLevel = 0
var usArtLevel = 0
var usNavLevel = 0
var infantryDefend = false
var artilleryDefend = false
var navalDefend = false
var infantryDefendEnemy = false
var artilleryDefendEnemy = false
var navalDefendEnemy = false

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	setLevels()
	
func setInfantryDefend(param):
	infantryDefend = param
	
func setArtilleryDefend(param):
	artilleryDefend = param
	
func setNavalDefend(param):
	navalDefend = param
	
func getInfantryDefendEnemy():
	return infantryDefendEnemy
	
func getArtilleryDefendEnemy():
	return artilleryDefendEnemy
	
func getNavalDefendEnemy():
	return navalDefendEnemy
	
func setInfantryDefendEnemy(param):
	infantryDefendEnemy = param
	
func setArtilleryDefendEnemy(param):
	artilleryDefendEnemy = param
	
func setNavalDefendEnemy(param):
	navalDefendEnemy = param

func setLevels():
	randomize()
	var numOfLevels = 3
	var num1 = randi()%3 + 1
	var num2 = randi()%3 + 1
	var num3 = randi()%2 + 1
	
	if num1 == 1:
		if num2 == 1:
			infantryLevel = 3
			navalLevel = 0
			artilleryLevel = 0
		elif num2 == 2:
			infantryLevel = 0
			navalLevel = 3
			artilleryLevel = 0
		elif num2 == 3:
			infantryLevel = 0
			navalLevel = 0
			artilleryLevel = 3
	elif num1 == 2:
			infantryLevel = 1
			navalLevel = 1
			artilleryLevel = 1
	elif num1 == 3:
		if num2 == 1:
			infantryLevel = 2
			if num3 == 1:
				navalLevel = 1
				artilleryLevel = 0
			elif num3 == 2:
				navalLevel = 0
				artilleryLevel = 1
		elif num2 == 2:
			navalLevel = 2
			if num3 == 1:
				infantryLevel = 1
				artilleryLevel = 0
			elif num3 == 2:
				infantryLevel = 0
				artilleryLevel = 1
		elif num2 == 3:
			artilleryLevel = 2
			if num3 == 1:
				infantryLevel = 1
				navalLevel = 0
			elif num3 == 2:
				infantryLevel = 0
				navalLevel = 1
		
func getNavalLevel():
	return navalLevel
	
func getArtilleryLevel():
	return artilleryLevel
	
func getInfantryLevel():
	return infantryLevel

func getDifficulty():
	return difficulty
	
func infantryGet():
	return infantryDone
	
func navalGet():
	return navalDone
	
func artilleryGet():
	return artilleryDone
	
func infantrySet():
	infantryDone = true
	
func navalSet():
	navalDone = true
	
func artillerySet():
	artilleryDone = true
	
func _on_Button_Pressed(): 
	var NextRoundButton = get_node("../NextRoundButton")
	if NextRoundButton.disabled == true:
		redAnimation.play("Test")
	else:
		if get_node("../MyHealthBar").value <= 0:
			get_tree().quit()
			
		var enemyInfLevel = int(get_node("../InfantryLevelDisplayEnemy").get_text())
		if enemyInfLevel == 1:
			get_parent().get_parent().get_node("game2").get_node("LEVEL 1 - AnimationPlayer - Group1 - 2").play("DEFEND RETURN LEVEL 1")
		elif enemyInfLevel == 2:
			get_parent().get_parent().get_node("game2").get_node("LEVEL 2 - AnimationPlayer - Group1 - 3").play("DEFEND RETURN LEVEL 2")
		elif enemyInfLevel == 3:
			get_parent().get_parent().get_node("game2").get_node("LEVEL 3 - AnimationPlayer - Group1 - 4").play("DEFEND RETUN LEVEL 3")
		elif enemyInfLevel == 4:
			get_parent().get_parent().get_node("game2").get_node("LEVEL 4 - AnimationPlayer - Group1 - 5").play("DEFEND RETURN LEVEL 4")
		elif enemyInfLevel == 5:
			get_parent().get_parent().get_node("game2").get_node("LEVEL 5 - AnimationPlayer - Group1 - 1").play("DEFEND RETURN LEVEL 5")
		
		
		
		if int(get_node("../InfantryLevelDisplay").get_text()) == 0:
			infantryDone = true
		if int(get_node("../NavalLevelDisplay").get_text()) == 0:
			navalDone = true
		if int(get_node("../ArtilleryLevelDisplay").get_text()) == 0:
			artilleryDone = true
			
		if infantryDone == true and navalDone == true and artilleryDone == true:
			setInfantryDefendEnemy(false)
			setNavalDefendEnemy(false)
			setArtilleryDefendEnemy(false)
			infantryDone = false
			navalDone = false
			artilleryDone = false
			
			var points = get_node("../PointsCounter")
			var val = int(points.get_text()) 
			var pointsToAdd = randi()%15 + 5
			points.set_text(str(val + pointsToAdd))
			val = int(get_node("../PointsCounter").get_text()) 
			
			if (val >= 15):
				var upgradeAvaliable = get_node("../UpgradeAvaliable2")
				upgradeAvaliable.visible = true
				
				var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
				upgradeAvaliable2.visible = false
			elif(val >= 10):
				var upgradeAvaliable = get_node("../UpgradeAvaliable2")
				upgradeAvaliable.visible = false
				
				var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
				upgradeAvaliable2.visible = true
			else:
				var upgradeAvaliable = get_node("../UpgradeAvaliable2")
				upgradeAvaliable.visible = false
				
				var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
				upgradeAvaliable2.visible = false
			greenAnimation.play("Test")
			
			var PointsCounterEnemy = get_node("../PointsCounterEnemy")
			
			var multiplier = 1
			var pointsToAdd2 = randi()%15 + 5
			var curr = 0
			var together = 0
			if difficulty == "Easy":
				pointsToAdd2 = randi()%10 + 5
				curr = int(PointsCounterEnemy.get_text())
				together = pointsToAdd2 + curr
				PointsCounterEnemy.set_text(str(together))	
				multiplier = 1
			elif difficulty == "Medium":
				pointsToAdd2 = randi()%15 + 5
				PointsCounterEnemy.set_text(str(int(PointsCounterEnemy.get_text()) + pointsToAdd2))
				multiplier = 2
			elif difficulty == "Hard":
				pointsToAdd2 = randi()%15 + 10
				PointsCounterEnemy.set_text(str(int(PointsCounterEnemy.get_text()) + pointsToAdd2))
				multiplier = 3
			
			
			var PointsCounterEnemyUpdated = get_node("../PointsCounterEnemy")
			
			while int(PointsCounterEnemyUpdated.get_text()) >= 15:
				var random = randi()%3 + 1
				if random == 1:
					var infantryLevel2 = get_node("../InfantryLevelDisplayEnemy")
					infantryLevel2.set_text(str(int(get_node("../InfantryLevelDisplayEnemy").get_text()) + 1))
					PointsCounterEnemyUpdated.set_text(str(int(get_node("../PointsCounterEnemy").get_text()) - 10))
				elif random == 2:
					var navalLevel2 = get_node("../NavalLevelDisplayEnemy")
					navalLevel2.set_text(str(int(get_node("../NavalLevelDisplayEnemy").get_text()) + 1))
					PointsCounterEnemyUpdated.set_text(str(int(get_node("../PointsCounterEnemy").get_text()) - 10))
				elif random == 3:
					var artilleryLevel2 = get_node("../ArtilleryLevelDisplayEnemy")
					artilleryLevel2.set_text(str(int(get_node("../ArtilleryLevelDisplayEnemy").get_text()) + 1))
					PointsCounterEnemyUpdated.set_text(str(int(get_node("../PointsCounterEnemy").get_text()) - 10))
			
			var PointsCounterEnemyUpdated2 = get_node("../PointsCounterEnemy")
			if int(PointsCounterEnemyUpdated2.get_text()) >= 10:
				var infrantryLevel3 = get_node("../InfantryLevelDisplayEnemy")
				infrantryLevel3.set_text(str(int(get_node("../InfantryLevelDisplayEnemy").get_text()) + 1))
				PointsCounterEnemyUpdated2.set_text(str(int(get_node("../PointsCounterEnemy").get_text()) - 10))
			
			var level1 = int(get_node("../InfantryLevelDisplayEnemy").get_text())
			var level2 = int(get_node("../NavalLevelDisplayEnemy").get_text())
			var level3 = int(get_node("../ArtilleryLevelDisplayEnemy").get_text())
			
			if level1 >= 1:
				get_parent().get_parent().get_node("game2").get_node("LEVEL 1 - AnimationPlayer - Group1 - 2").get_node("Sprite").visible = true
			if level1 >= 2:
				get_parent().get_parent().get_node("game2").get_node("LEVEL 2 - AnimationPlayer - Group1 - 3").get_node("Sprite").visible = true
			if level1 >= 3:
				get_parent().get_parent().get_node("game2").get_node("LEVEL 3 - AnimationPlayer - Group1 - 4").get_node("Sprite").visible = true
			if level1 >= 4:
				get_parent().get_parent().get_node("game2").get_node("LEVEL 4 - AnimationPlayer - Group1 - 5").get_node("Sprite").visible = true
			if level1 >= 5:
				get_parent().get_parent().get_node("game2").get_node("LEVEL 5 - AnimationPlayer - Group1 - 1").get_node("Sprite2").visible = true
			
			if level2 >= 1:
				get_parent().get_parent().get_node("game2").get_node("group 1 - ships4").get_node("Sprite").visible = true
			if level2 >= 3:
				get_parent().get_parent().get_node("game2").get_node("group 1 - ships5").get_node("Sprite").visible = true
			if level2 >= 5:
				get_parent().get_parent().get_node("game2").get_node("group 1 - ships6").get_node("Sprite").visible = true

			if level3 >= 1:
				get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").visible = true
			if level3 >= 3:
				get_parent().get_parent().get_node("game2").get_node("AnimatedSprite2").visible = true
			if level3 >= 5:
				get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").visible = true
			
			var myHealth = get_node("../MyHealthBar")
			var pointsToNotDecreaseBy = 0
			randomize()
			var num1 = randi()%4 + 1
			var num2 = randi()%4 + 1
			var num3 = randi()%4 + 1
			
			if level1 > 0:
				if num1 != 2:
					if infantryDefend == true:
						var ourInfantryLevel = int(get_node("../InfantryLevelDisplay").get_text())
						pointsToNotDecreaseBy = ((ourInfantryLevel * 2) + randi()%5 + (1 * ourInfantryLevel)) * 0.8
				
					if level1 == 1:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 1 - AnimationPlayer - Group1 - 2").play("group 1 attack ")
					elif level1 == 2:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 2 - AnimationPlayer - Group1 - 3").play("group 1 attack")
					elif level1 == 3:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 3 - AnimationPlayer - Group1 - 4").play("group 1 attack")
					elif level1 == 4:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 4 - AnimationPlayer - Group1 - 5").play("group 1 attack")
					elif level1 == 5:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 5 - AnimationPlayer - Group1 - 1").play("group1_walking")
	
					#yield(get_tree().create_timer(4), "timeout")
					
					var pointsToDecreaseBy = ((level1 * 2) + randi()%5 + (1 * level1)) - pointsToNotDecreaseBy
					if pointsToDecreaseBy > 0:
						myHealth.set_value(get_node("../MyHealthBar").value - pointsToDecreaseBy)
				else:
					if level1 == 1:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 1 - AnimationPlayer - Group1 - 2").play("DEFEND GO LEVEL 1")
					elif level1 == 2:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 2 - AnimationPlayer - Group1 - 3").play("DEFEND GO LEVEL 2")
					elif level1 == 3:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 3 - AnimationPlayer - Group1 - 4").play("DEFEND GO LEVEL 3")
					elif level1 == 4:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 4 - AnimationPlayer - Group1 - 5").play("DEFEND GO LEVEL 4")
					elif level1 == 5:
						get_parent().get_parent().get_node("game2").get_node("LEVEL 5 - AnimationPlayer - Group1 - 1").play("DEFEND GO LEVEL 5")
					setInfantryDefendEnemy(true)
				
			if level2 > 0:
				if num2 != 2:
					if navalDefend == true:
						var ourNavalLevel = int(get_node("../NavalLevelDisplay").get_text())
						pointsToNotDecreaseBy = ((ourNavalLevel * 2) + randi()%5 + (1 * ourNavalLevel)) * 0.8
					
					
					if level2 == 1 or level2 == 2:
						get_parent().get_parent().get_node("game2").get_node("group1 - fireball2").visible = true
						get_parent().get_parent().get_node("game2").get_node("LEVEL 1 - AnimationPlayer - Group1 - 2").play("SHIP LEVEL 1 - group 1 fireball")
					if level2 == 3 or level2 == 4:
						get_parent().get_parent().get_node("game2").get_node("group1 - fireball2").visible = true
						get_parent().get_parent().get_node("game2").get_node("group1 - fireball1").visible = true
						get_parent().get_parent().get_node("game2").get_node("LEVEL 1 - AnimationPlayer - Group1 - 2").play("SHIP LEVEL 3+4 - group 1 fireball")
					if level2 >= 5:
						get_parent().get_parent().get_node("game2").get_node("group1 - fireball2").visible = true
						get_parent().get_parent().get_node("game2").get_node("group1 - fireball1").visible = true
						get_parent().get_parent().get_node("game2").get_node("group1 - fireball3").visible = true
						get_parent().get_parent().get_node("game2").get_node("LEVEL 1 - AnimationPlayer - Group1 - 2").play("SHIP LEVEL 5 - group 1 fireball")
					
					yield(get_tree().create_timer(2.7), "timeout")
					
					get_parent().get_parent().get_node("game2").get_node("group1 - fireball2").visible = false
					get_parent().get_parent().get_node("game2").get_node("group1 - fireball1").visible = false
					get_parent().get_parent().get_node("game2").get_node("group1 - fireball3").visible = false
					
					var pointsToDecreaseBy2 = ((level2 * 4) + randi()%10 + (1 * level2)) - pointsToNotDecreaseBy
					if pointsToDecreaseBy2 > 0:
						myHealth.set_value(get_node("../MyHealthBar").value - pointsToDecreaseBy2)
				else:
					print("Naval Defend")
					setNavalDefendEnemy(true)
			
			if level3 > 0:
				if num3 != 2:
					if artilleryDefend == true:
						var ourArtilleryLevel = int(get_node("../ArtilleryLevelDisplay").get_text())
						pointsToNotDecreaseBy = ((ourArtilleryLevel * 2) + randi()%5 + (1 * ourArtilleryLevel)) * 0.8
					
					if level3 == 1 or level3 == 2:
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").playing = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").get_node("group1 - fireball6").visible = true
						get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("LEVEL 1 + 2 - Cannon GROUP 1")
					if level3 == 3 or level3 == 4:
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").playing = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").get_node("group1 - fireball6").visible = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").playing = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").get_node("group1 - fireball9").visible = true
						get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("LEVEL 3 + 4 - Cannon GROUP 1")
					if level3 >= 5:
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").playing = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").get_node("group1 - fireball6").visible = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").playing = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").get_node("group1 - fireball9").visible = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite2").playing = true
						get_parent().get_parent().get_node("game2").get_node("AnimatedSprite2").get_node("group1 - fireball8").visible = true
						get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("LEVEL 5 - Cannon GROUP 1")
					
					yield(get_tree().create_timer(.9), "timeout")
					get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").playing = false
					get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").playing = false
					get_parent().get_parent().get_node("game2").get_node("AnimatedSprite2").playing = false
					
					yield(get_tree().create_timer(1.8), "timeout")
					get_parent().get_parent().get_node("game2").get_node("AnimatedSprite").get_node("group1 - fireball6").visible = false
					get_parent().get_parent().get_node("game2").get_node("AnimatedSprite3").get_node("group1 - fireball9").visible = false
					get_parent().get_parent().get_node("game2").get_node("AnimatedSprite2").get_node("group1 - fireball8").visible = false
					
					var pointsToDecreaseBy3 = ((level3 * 3) + randi()%20 + (1 * level3)) - pointsToNotDecreaseBy
					if pointsToDecreaseBy3 > 0:
						myHealth.set_value(get_node("../MyHealthBar").value - pointsToDecreaseBy3)
				else:
					print("Artillery Defend")
					setArtilleryDefendEnemy(true)
				
			if get_node("../TheirHealthBar").value <= 0:
				var InvadeInfantry = get_node("../InvadeInfantry")
				InvadeInfantry.visible = true
				infantrySet()
				artillerySet()
				navalSet()
				var menu = get_node("../MenuButton")
				menu.disabled = true
				var upgrade = get_node("../UpgradeButton")
				upgrade.disabled = true
				var nextRound = get_node("../NextRoundButton")
				nextRound.disabled = true
				
				
			if infantryDefend == true:
				var levelsInfantry = get_node("../InfantryLevelDisplay").getVal()
				if levelsInfantry == 1:
					get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 1 - AnimationPlayer - Group2 - 1").play("DEFEND RETURN LEVEL 1")
				elif levelsInfantry == 2:
					get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 2 - AnimationPlayer - Group2 - 2").play("DEFEND RETURN LEVEL 2")
				elif levelsInfantry == 3:
					get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 3 - AnimationPlayer - Group2 - 4").play("DEFEND RETURN LEVEL 3")
				elif levelsInfantry == 4:
					get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 4 - AnimationPlayer - Group2 - 5").play("DEFEND RETURN LEVEL 4")
				elif levelsInfantry == 5:
					get_parent().get_parent().get_node("game2").get_node("PPL LEVEL 5 - AnimationPlayer - Group2 - 3").play("DEFEND RETURN LEVEL 5")
				
				yield(get_tree().create_timer(2), "timeout")
				
			setInfantryDefend(false)
			setNavalDefend(false)
			setArtilleryDefend(false)
		else:
			redAnimation.play("Test")
