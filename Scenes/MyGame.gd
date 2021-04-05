extends Node2D

var difficulty = "Easy"
var infantry = 1
var naval = 1
var artillery = 1

func _ready():
	pass
	
func setEverything():
	get_node("../NextRoundButton").setDifficulty(difficulty, infantry, naval, artillery)
	
func startDifficulty(param, infantry, naval, artillery):
	difficulty = param
	#setEverything()
	
func getDifficulty():
	return difficulty
	
func getInfantry():
	return infantry
	
func getNaval():
	return naval
	
func getArtillery():
	return artillery


