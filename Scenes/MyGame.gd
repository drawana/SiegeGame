extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ourWalls : int
var theirWalls : int
var manpower : int
var cannonballs : int
var morale: int 
var week : int
var navyDmg: int
var infDmg : int
var cannonDmg : int
var stormed: bool
var lost : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	ourWalls = 50
	theirWalls = 100
	manpower = 10000
	cannonballs = 5
	morale = 10
	week = 1
	navyDmg = 0
	infDmg = 0
	cannonDmg = 0
	stormed = false
	lost = false
	
	$GUI/Recap.hide()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_StartButton_pressed():
	var moraleChange = 0
	var manpowerChange = 0
	var wallDmg = 0
	$GUI/Menu.hide()
	if $GUI/Menu.navalChoice == "siege":
		navyDmg = randi() % 10 + 1
		theirWalls -= navyDmg
	else:
		navyDmg = 0
		manpower += 1000
		cannonballs += 2
		
	if $GUI/Menu.infChoice == "siege":
		infDmg = randi() % 5 + 1
		theirWalls -= infDmg
		manpower -= 2000
	elif $GUI/Menu.infChoice == "rest":
		if morale < 10 :
			 morale +=1
		infDmg = 0
	else:
		if theirWalls == 0:
			stormed = true
		else:
			morale -= 3
			
			
	if $GUI/Menu.artChoice == "siege":
		cannonDmg = randi() % 50 + 1
		theirWalls -= cannonDmg
	else:
		cannonDmg = 0

	$GUI/Recap/Week.text = "Week: " + str(week)
	$GUI/Recap/InfDmg.text = "Infantry Damage: " + str(infDmg)
	$GUI/Recap/NavyDmg.text = "Naval Damage: " + str(navyDmg)
	$GUI/Recap/CannonDmg.text = "Artillery Damage: " + str(cannonDmg)
	$GUI/Recap/morale.text = "Morale: " + str(morale)
	$GUI/Recap/cannonballs.text = "Cannonballs: " + str(cannonballs)
	$GUI/Recap/manpower.text = "manpower: " + str(manpower)
	
	$GUI/Recap.show()
	
	


func _on_TextureButton_pressed():
	$GUI/Recap.hide()
	week += 1
	$GUI/Menu.show()
