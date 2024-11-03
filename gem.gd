extends Area2D

@export var award_amount: int = 1
@onready var gem = $Sprite2D

signal player_picked_up_gem(award_amount)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and gem.is_visible():

		player_picked_up_gem.emit(award_amount)
		gem.hide()
		
		#award_amount =0
		
