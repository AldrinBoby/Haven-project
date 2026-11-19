extends Node2D

const BULLET = preload("res://scenes/bullet.tscn")
@onready var muzzle: Marker2D = $Marker2D
@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var weapon: Sprite2D = $weapon
@onready var boom: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	var facing_left = get_global_mouse_position().x < global_position.x

	weapon.flip_v = facing_left
	animated_sprite.flip_h = get_global_mouse_position().x < global_position.x
	
	if Input.is_action_just_pressed("fire"):
		boom.playing = 1 
		var bullet_instance = BULLET.instantiate()

		bullet_instance.global_position = muzzle.global_position
		bullet_instance.global_rotation = global_rotation
		bullet_instance.teleport_requested.connect($"../".teleport_to_position)
		get_tree().root.add_child(bullet_instance)
