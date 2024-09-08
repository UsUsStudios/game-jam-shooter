extends Area2D

@onready var PLAYER = get_tree().root.get_node("Main/Player")
const SPEED = 100

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	body.queue_free()

func _process(delta: float) -> void:
	look_at(PLAYER.global_position)
	position.x += cos(rotation) * SPEED * delta
	position.y += sin(rotation) * SPEED * delta
	rotation_degrees += 90
