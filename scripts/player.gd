extends CharacterBody2D

const SPEED = 300

@onready var MAIN_SCENE = get_node("..")
const bullet = preload("res://scenes/bullet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var dirHorizontal = Input.get_axis("Left", "Right")
	var dirVertical = Input.get_axis("Up", "Down")
	if dirVertical and dirHorizontal:
		velocity.x = dirHorizontal * SPEED / 1.4
		velocity.y = dirVertical * SPEED / 1.4
	else:
		velocity.x = dirHorizontal * SPEED
		velocity.y = dirVertical * SPEED
	
	if Input.is_action_just_pressed("Shoot"):
		if dirVertical or dirHorizontal:
			$AnimatedSprite2D.play("flying_shooting")
		else:
			$AnimatedSprite2D.play("idle_shooting")
		MAIN_SCENE.add_child(bullet.instantiate())
	else:
		if dirVertical or dirHorizontal:
			$AnimatedSprite2D.play("flying")
		else:
			$AnimatedSprite2D.play("idle")
	
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	
	move_and_slide()
