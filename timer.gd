extends Timer

var customer1 = preload("res://cust_1.tscn")
var customer2 = preload("res://cust_2.tscn")
var customer3 = preload("res://cust_3.tscn")

var customers = [customer1, customer2, customer3]
var spawn_timer = 0  # Initialize the spawn timer
const SPAWN_INTERVAL = 5  # Spawn a customer every 5 seconds

func _process(delta):
	spawn_timer += delta

	if spawn_timer >= SPAWN_INTERVAL:
		spawn_customer()
		spawn_timer = 0

func spawn_customer():
	var kind = customers[randi() % customers.size()]
	var customer = kind.instance()
	customer.position = Vector2(randf_range(10, 10), randf_range(1, 10))
	add_child(customer)
