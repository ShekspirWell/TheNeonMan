extends Node2D

const attackPath = preload("res://prefabs/Attack.tscn")


func _ready():
	$Timer.start()


func _on_Timer_timeout():
	if len($Attacks.get_children()) < 5:
		spawn_attack()


func spawn_attack():
	var attack = attackPath.instance()
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	attack.position.y = 450
	attack.position.x = randi() % 300 + 40

	$Attacks.add_child(attack)
