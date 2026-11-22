extends Node

@export var max_health:float= 100.0
var health:float

func _ready() -> void:
	health = max_health
	
func damage(amount:float) -> void:
	health -= amount
	health = max(health,0)
	print("health :" , health)

func dead() -> bool:
	return health <= 0
