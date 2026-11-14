extends Node2D
@onready var weapon: Sprite2D = $weapon


func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
