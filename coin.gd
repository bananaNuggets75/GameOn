extends Node2D

@export var coin_value : int = 1  # You can set different values for different coins

func _ready():
	pass

# Called when the area overlaps with another area
func _on_Area2D_area_entered(area):
	if area.is_in_group("CoinJar"):
		handle_dragged(area)

# Handle the dragged item entering the coin area
func handle_dragged(dragged_item):
	# Assuming you have logic to determine if the dragged item is a coin
	# Add any additional logic here based on your implementation

	# Emit a signal or perform other actions as needed
	emit_signal("coin_picked_up", coin_value)

	# Delete the coin (optional)
	queue_free()

