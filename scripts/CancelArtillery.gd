extends TextureButton

func _ready():
		
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_Pressed():
	var BigAttackArtillery = get_node("../BigAttackArtillery")
	BigAttackArtillery.visible = false
	
	var DefendArtillery = get_node("../DefendArtillery")
	DefendArtillery.visible = false
	
	var CancelArtillery = get_node("../CancelArtillery")
	CancelArtillery.visible = false
