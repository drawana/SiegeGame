extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("animation_finished", self, "_on_AnimatedSprite_animation_finished")
	
func _on_AnimatedSprite_animation_finished():
	if self.animation == "shootball":
		animation = "fire explosion"
	else:
		animation = "shootball"
