extends TextureButton


func _ready():
	connect("pressed",self,"_on_Button_Pressed")
	
func _on_Button_Pressed():
	get_tree().reload_current_scene()
