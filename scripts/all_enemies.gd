extends Node2D

var frame = 0
const ENEMY = preload("res://scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frame += 1
	if frame % 30 == 0:
		add_child(ENEMY.instantiate())
