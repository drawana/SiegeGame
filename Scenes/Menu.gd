extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var navalChoice = ""
export var infChoice = ""
export var artChoice = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Resupply_pressed():
	$NavalContainer/Siege.pressed = false
	$NavalContainer/Resupply.pressed = true
	navalChoice = "resupply"


func _on_Naval_Siege_pressed():
	$NavalContainer/Siege.pressed = true
	$NavalContainer/Resupply.pressed = false
	navalChoice = "siege"


func _on_Inf_Siege_pressed():
	$InfContainer/InfSiege.pressed = true
	$InfContainer/InfRest.pressed = false
	$InfContainer/Storm.pressed = false
	infChoice = "siege"


func _on_Inf_Rest_pressed():
	$InfContainer/InfSiege.pressed = false
	$InfContainer/InfRest.pressed = true
	$InfContainer/Storm.pressed = false
	infChoice = "rest"


func _on_Storm_pressed():
	$InfContainer/InfSiege.pressed = false
	$InfContainer/InfRest.pressed = false
	$InfContainer/Storm.pressed = true
	infChoice = "storm"


func _on_Artillery_Siege_pressed():
	$ArtilleryContainer/ArtillerySiege.pressed = true
	$ArtilleryContainer/ArtilleryRest.pressed = false
	artChoice = "siege"


func _on_Artillery_Rest_pressed():
	$ArtilleryContainer/ArtillerySiege.pressed = false
	$ArtilleryContainer/ArtilleryRest.pressed = true
	artChoice = "rest"
