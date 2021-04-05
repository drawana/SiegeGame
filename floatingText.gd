extends Position2D

onready var label = get_node("Label")
onready var tween = get_node("Tween")
var amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass
	label.set_text(str(amount))
	tween.interpolate_property(self, 'scale', scale, Vector2(1, 1), 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(self, 'scale', Vector2(1, 1), Vector2(0.1, 0.1), 0.7, Tween.TRANS_LINEAR, Tween.EASE_OUT, 0.3)
	tween.start()
	
	#yield(tween, "tween_all_completed")
	#queue_free()
#func _on_Butto
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
