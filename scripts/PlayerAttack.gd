extends KinematicBody2D

export (int) var speed = 200
export var velocity = Vector2(1, 0)


func _process(delta):
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body.is_in_group('border'):
		if body.name == 'RightBorder':
			velocity.x = -1
		elif body.name == 'LeftBorder':
			velocity.x = 1


func get_attacks_array():
	return $Area2D.get_overlapping_areas()
