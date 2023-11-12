extends StaticBody2D

var progressBar : ProgressBar

func _ready():
	modulate = Color(Color.YELLOW, 1)
	progressBar = $TextureProgressBar # Make sure to set the correct path to your ProgressBar node

func _process(delta):
	if Global.is_dragging:
		visible = true

# Called when an object enters the area
func _on_Area2D_body_entered(body):
	if body.is_in_group("Coin"):
		handle_coin_delivery(body)

# Handle the coin delivered to the StaticBody2D
func handle_coin_delivery(coin_body):
	var coin_value : int = coin_body.coin_value  # Assuming you have a coin_value property in your Coin script
	progressBar.value += coin_value  # Increase the progress bar value based on the coin's value

	# Delete the coin
	coin_body.queue_free()
