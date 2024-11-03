extends Area2D

const speed = 100

func _physics_process(delta):
	position.x += -speed*delta
