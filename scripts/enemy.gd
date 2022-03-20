extends KinematicBody2D


func _ready():
	pass 


func _process(_delta):
	pass


func _on_HitBox_body_entered(body):
	if body.is_in_group('bullet'):
		body.queue_free()
