extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var direction = Input.get_vector("left","right","up","down")
	#position +=direction *300 *delta
	#
	
	if Input.is_action_just_pressed("interact"):
		print("open dialogue")
	pass
