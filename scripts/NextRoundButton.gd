extends TextureButton

var infantryDone = false
var navalDone = false
var artilleryDone = false
onready var redAnimation = $RedAnimation
onready var greenAnimation = $GreenAnimation
var difficulty = "Easy"


func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
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
	if infantryDone == true and navalDone == true and artilleryDone == true:
		infantryDone = false
		navalDone = false
		artilleryDone = false
		
		var points = get_node("../PointsCounter")
		var val = int(points.get_text()) 
		points.set_text(str(val + 5))
		
		if (val + 5 >= 15):
			var upgradeAvaliable = get_node("../UpgradeAvaliable2")
			upgradeAvaliable.visible = true
			
			var upgradeAvaliable2 = get_node("../UpgradeAvaliable")
			upgradeAvaliable2.visible = false
		elif(val + 5 >= 10):
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
		get_node("../PointsCounterEnemy").set_text(str(int(PointsCounterEnemy.get_text()) + 5))
		
		var multiplier = 1
		if difficulty == "Easy":
			multiplier = 1
		elif difficulty == "Medium":
			multiplier = 2
		elif difficulty == "Hard":
			multiplier = 3
			
		var PointsCounterEnemyUpdated = get_node("../PointsCounterEnemy")
		
		while PointsCounterEnemyUpdated > 15:
			var random = randi()%3 + 1
			
			if random == 1:
				
				
			elif random == 2:
				
				
			elif random == 3:
			
			
			
			
		if PointsCounterEnemyUpdated > 10:
			
		
			
		
		#var points3 = get_node("../MyHealthBar")
		
		#var level = get_node("../InfantryLevelDisplay").getVal()
		#var pointsToDecreaseBy = (level * 2) + randi()%(level * 10) + 1
		
		#get_node("../MyHealthBar").set_value(points3.value - pointsToDecreaseBy)
		
		
		
	else:
		redAnimation.play("Test")
