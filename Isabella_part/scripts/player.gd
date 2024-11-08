extends CharacterBody2D


const speed = 100
var current_dir = "none"
func _physics_process(delta):
	player_movement(delta)
	current_camera()
	
func player_movement(delta):
		
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x=speed
		velocity.y=0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x=-speed
		velocity.y=0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x=0
		velocity.y=speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x=0
		velocity.y=-speed
	else:
		play_anim(0)
		velocity.x=0
		velocity.y = 0
			
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("front_walk")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("back_walk")
			
	
		
func player():
	pass
	
func current_camera():
	if Global.current_scene == "world":
		$world_camera.enabled = true
		$offside_camera.enabled = false
	elif Global.current_scene == "cliffside":
		$world_camera.enabled = false
		$offside_camera.enabled = true
		
	
	
