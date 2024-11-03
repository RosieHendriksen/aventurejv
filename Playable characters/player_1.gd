extends CharacterBody2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100,200)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left","right","down","up")
	velocity = direction *300
	move_and_slide()
	pass
