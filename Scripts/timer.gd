extends Node2D

@export var customers: Array[PackedScene] = []

@onready var spawn_timer = $Timer
@onready var spawn_positions = [
	Vector2(154, 205),
	Vector2(444, 205),
	Vector2(740, 205)
]

func _on_timer_timeout():
	var customer_kind = customers[randi_range(0, customers.size() - 1)]  
	var customer_instance = customer_kind.instantiate()
	var random_position = spawn_positions[randi_range(0, spawn_positions.size() - 1)]  
	
	customer_instance.position = random_position  
	get_parent().add_child(customer_instance)  
	
	var delete_timer = Timer.new()  
	delete_timer.wait_time = 10.0  
	delete_timer.one_shot = true  
	customer_instance.add_child(delete_timer)  
  # Connect the Timer signal
	delete_timer.start()  


