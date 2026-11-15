extends CharacterBody2D

signal teleport_requested(target_position: Vector2, normal: Vector2)

const SPEED: int = 300
const MAX_BOUNCES: int = 3

var bounce_count: int = 0

func _ready() -> void:
	velocity = global_transform.x * SPEED

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)

	if collision:
		bounce_count += 1

		if bounce_count >= MAX_BOUNCES:
			velocity = Vector2.ZERO
			teleport_requested.emit(global_position, collision.get_normal())
			return

		velocity = velocity.bounce(collision.get_normal())
