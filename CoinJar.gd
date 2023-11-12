extends Node2D

var progressBar : ProgressBar
var coin : TextureRect

func _ready():
	progressBar = $CoinJar
	coin = $Coin

# Called when an object enters the area
func _on_StaticBody2D_body_entered(body):
	if body.is_in_group("Coin"):
		handle_coin_dragged(body)

# Handle the coin dragged into the StaticBody2D
func handle_coin_dragged(coin_body):
	# Increase the progress bar value based on coin value
	if coin_body.value == 1:
		progressBar.value += 1 
	elif coin_body.value == 3:
		progressBar.value += 3
	elif coin_body.value == 5:
		progressBar.value += 5
	elif coin_body.value == 7:
		progressBar.value += 7
	elif coin_body.value == 10:
		progressBar.value += 10

	# Delete the coin
	coin_body.queue_free()
