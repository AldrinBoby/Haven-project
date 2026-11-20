extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var explosion: AnimatedSprite2D = $explosion
@onready var boom: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var fall_speed: float = 400.0

var exploding: bool = false

func _ready() -> void:
	explosion.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if exploding:
		return
	velocity = Vector2(0,fall_speed)
	var collision = move_and_collide(velocity * delta)
	if collision:
		explode()
		
func explode() -> void:
	exploding = true
	boom.playing = 1
	velocity = Vector2.ZERO
	
	sprite_2d.hide()
	collision_shape_2d.set_deferred("disabled",true)
	
	explosion.show()
	explosion.play("explosion")
	await explosion.animation_finished
	queue_free()
	
