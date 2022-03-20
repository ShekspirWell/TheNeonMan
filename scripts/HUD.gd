extends Node2D


func _ready():
	pass


func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()


func shoot():
	var attack_array = $PlayerAttack.get_attacks_array()
	
	if len(attack_array) > 0:
		attack_array[-1].queue_free()
	else:
		print('player get damage')
