extends Area2D

signal customer_despawned

@export var speed = -25

func _ready():
	pass

func _process(delta):
	global_position.x += speed * delta

# Called when an object enters the area
func _on_Area2D_body_entered(body):
	if body.is_in_group("draggable"):
		handle_item_delivery(body)

# Handle the delivery of a draggable item to the customer
func handle_item_delivery(item):
	# Emit the item_delivered signal passing the item
	emit_signal("item_delivered", item)

	# Optionally, you can add logic here to leave coins on the table or perform other actions
	
	# Delete the delivered item
	item.queue_free()

	# Emit signal to notify CustomerManager to despawn this customer
	emit_signal("customer_despawned", self)
