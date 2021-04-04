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

func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	setLevels()

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

func setDifficulty(param):
	difficulty = param
	
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
		if infantryDone == true and navalDone == true and artilleryDone == true:
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
				pointsToAdd2 = randi()%15 + 10
				PointsCounterEnemy.set_text(str(int(PointsCounterEnemy.get_text()) + pointsToAdd2))
				multiplier = 2
			elif difficulty == "Hard":
				pointsToAdd2 = randi()%20 + 10
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
			
			var myHealth = get_node("../MyHealthBar")
			var level1 = int(get_node("../InfantryLevelDisplayEnemy").get_text())
			if level1 > 0:
				var pointsToDecreaseBy = (level1 * 2) + randi()%(level1 * 10) + 0
				myHealth.set_value(get_node("../MyHealthBar").value - pointsToDecreaseBy)
	
			var level2 = int(get_node("../NavalLevelDisplayEnemy").get_text())
			if level2 > 0:
				var pointsToDecreaseBy2 = (level2 * 3) + randi()%(level2 * 2) + 0
				myHealth.set_value(get_node("../MyHealthBar").value - pointsToDecreaseBy2)
			
			var level3 = int(get_node("../ArtilleryLevelDisplayEnemy").get_text())
			if level3 > 0:
				var pointsToDecreaseBy3 = (level3 * 5) + randi()%(level3 * 1) + 0
				myHealth.set_value(get_node("../MyHealthBar").value - pointsToDecreaseBy3)
			
			if get_node("../MyHealthBar").value <= 0:
				get_tree().quit()
				
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
		else:
			redAnimation.play("Test")
