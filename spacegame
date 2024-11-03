extends CharacterBody2D 

# Member variables for movement
var speed: float = 200  # Horizontal speed
var jump_speed: float = -400  # Jump speed (negative to move up)
var air_control: float = 100  # Control speed in mid-air
var vertical_movement: float = 0  # Track vertical movement state
var max_left_position: float  # Variable for the leftmost position allowed

func _ready():
	max_left_position = position.x  # Initialize the maximum left position to the starting position

func _physics_process(delta: float) -> void:
	# Reset horizontal velocity
	velocity.x = 0

	# Check for player input for horizontal movement
	if Input.is_action_pressed("ui_right"):  # Move right
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):  # Move left
		velocity.x -= speed

	# Mid-air control
	if Input.is_action_pressed("ui_up"):  # Move up
		vertical_movement += -air_control * delta  # Move up
	if Input.is_action_pressed("ui_down"):  # Move down
		vertical_movement += air_control * delta  # Move down
	
	if Input.is_action_pressed("ui_left") and position.x > max_left_position:
		velocity.x -= speed  # Move left

	# Apply vertical movement
	velocity.y = vertical_movement

	# Move the character
	move_and_slide()  # Call without parameters to use internal velocity

	# Check for collision when moving down
	if is_on_floor() and vertical_movement > 0:
		vertical_movement = 0  # Prevent falling through the ground if on the floor

	# Optional: Reset vertical movement when not pressing up or down
	if not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		vertical_movement = 0  # Stop vertical movement when no key is pressed

	# Clamp vertical movement to prevent moving through the floor
	if vertical_movement < 0 and is_on_floor():
		vertical_movement = 0  # Prevent moving down into the floor

