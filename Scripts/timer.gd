extends Node2D

@export var customers: Array[PackedScene] = []

@onready var spawn_timer = $Timer  # Replace with the actual name of your Timer node
@onready var spawn_positions = [
	Vector2(154, 200),
	Vector2(444, 200),
	Vector2(740, 200)
]

func _on_timer_timeout():
	var customer_kind = customers[randi_range(0, customers.size() - 1)]  # Randomly select a customer kind
	var customer_instance = customer_kind.instantiate()  # Instantiate the selected customer kind
	var random_position = spawn_positions[randi_range(0, spawn_positions.size() - 1)]  # Randomly select a spawn position
	
	print("Random Position: ", random_position)  # Debugging print
	
	customer_instance.position = random_position  # Set the position
	get_parent().add_child(customer_instance)  # Add the customer to the parent node


