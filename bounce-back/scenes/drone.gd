extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var detectionarea: Area2D = $detectionarea


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	detectionarea.monitoring = false
	
	animated_sprite_2d.play_backwards("landing")
	animation_player.play("landing_collision")
	await animated_sprite_2d.animation_finished
	
	animated_sprite_2d.play("idle")
	detectionarea.monitoring = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
