extends CharacterBody2D
const SPEED = 500
@onready var PLAYER = get_node("../Player")
var frame = 0
const LIFETIME = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = PLAYER.position.x
	position.y = PLAYER.position.y
	rotation_degrees = PLAYER.rotation_degrees - 90


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	frame += 1
	velocity.x = cos(rotation) * SPEED
	velocity.y = sin(rotation) * SPEED
	move_and_slide()
	if frame > LIFETIME:
		queue_free()
