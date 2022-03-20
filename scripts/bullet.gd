extends KinematicBody2D

var start_position
var velosity = Vector2(0, 0)

var speed = 700


func _ready():
	start_position = position


func _physics_process(delta):
	var _move_info = move_and_collide(velosity.normalized() * delta * speed)
	
	if abs(position.x) > abs(start_position.x) * 3 or \
	   abs(position.y) > abs(start_position.y) * 3:
		queue_free()
