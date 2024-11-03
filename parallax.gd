extends Node2D  # Or whatever your main scene node is

const RockScene = preload("res://rocks.tscn")
const SPAWN_INTERVAL = 0.5  # Time in seconds between spawns
var timer: Timer

func _ready():
	# Create and configure the timer
	timer = Timer.new()
	timer.wait_time = SPAWN_INTERVAL
	timer.one_shot = false  # This allows the timer to repeat
	add_child(timer)

	# Use the Callable structure for connection
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))

	timer.start()

func _on_Timer_timeout():
	spawn_rock()

func spawn_rock():
	# Instantiate a new rock using instantiate() in Godot 4.x
	var rock_instance = RockScene.instantiate()

	# Set the initial position of the rock (off-screen to the right)
	rock_instance.position.x = 700  # Fixed horizontal position

	# Set a random vertical position between a specified range
	rock_instance.position.y = rand_range(100, 400)  # Random vertical position within the range

	add_child(rock_instance)

# Custom function to generate a random float within a range
func rand_range(min: float, max: float) -> float:
	return min + randf() * (max - min)
