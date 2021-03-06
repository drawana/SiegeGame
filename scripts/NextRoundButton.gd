extends TextureButton

var infantryDone = false
var navalDone = true
var artilleryDone = true
onready var redAnimation = $RedAnimation


func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func infantrySet():
	infantryDone = true
	
func navalSet():
	navalDone = true
	
func artillerySet():
	artilleryDone = true
	
func _on_Button_Pressed(): 
	if infantryDone == true and navalDone == true and artilleryDone == true:
		infantryDone = false
		#navalDone = false
		#artilleryDone = false
		
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
	else:
		redAnimation.play("Test")
