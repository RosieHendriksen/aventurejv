extends CharacterBody2D

var is_chatting = false

var player
var player_in_chat_zone = false

func _process(delta):
	$AnimatedSprite2D.play("idle")
	
	
func _on_chat_detection_area_body_enetered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true
		
	
func _on_chat_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false
		
