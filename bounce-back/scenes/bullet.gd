extends CharacterBody2D

const SPEED: int = 300

func _ready() -> void:
	velocity = global_transform.x * SPEED

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)

	if collision:
		velocity = velocity.bounce(collision.get_normal())
