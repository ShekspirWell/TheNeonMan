extends KinematicBody2D

const bulletPath = preload("res://prefabs/Bullet.tscn")

export (int) var speed = 300
export (int) var dp = 5

var velocity = Vector2()


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	$AttackDirection.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	if Input.is_action_just_pressed("info"):
		print_info()


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)


func shoot():
	var bullet = bulletPath.instance()
	bullet.position = $AttackDirection/AIM.global_position
	bullet.rotate($AttackDirection.global_rotation)
	bullet.velosity = get_global_mouse_position() - bullet.position
	
	get_tree().get_root().add_child(bullet)


func print_info():
	print('--------------')
#	print('Sight objects: ' + str($Sight.get_overlapping_bodies()))
	
	print('opjects: ' + str(get_tree().get_root().get_children()))
