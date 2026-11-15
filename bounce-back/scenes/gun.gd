extends Node2D

const BULLET = preload("res://scenes/bullet.tscn")
@onready var muzzle: Marker2D = $Marker2D
@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var weapon: Sprite2D = $weapon

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if rotation_degrees > 90 and rotation_degrees < 270:
		weapon.flip_v = 1
	else:
		weapon.flip_v = 0
	if rotation_degrees > -90 and rotation_degrees < 90:
		weapon.flip_v = 0
	if rotation_degrees < -90 and rotation_degrees < 90:
		weapon.flip_v = 1
		
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = BULLET.instantiate()

		bullet_instance.global_position = muzzle.global_position
		bullet_instance.global_rotation = global_rotation
		get_tree().root.add_child(bullet_instance)
	if rotation_degrees > -90 and rotation_degrees < 90:
		animated_sprite.flip_h = 0 
	if rotation_degrees < -90 and rotation_degrees < 90:
		animated_sprite.flip_h = 1
		
