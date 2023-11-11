extends TextureProgressBar

var maxCoins = 100
var coinsSold = 0

func _ready():
	# Set up initial values for the coin container
	max_value = maxCoins
	value = coinsSold % maxCoins

# Call this function whenever a product is sold
func sellProduct():
	coinsSold += 10  # Assuming each product contributes 10 coins
	updateCoinContainer()

# Update the coin container based on the number of coins sold
func updateCoinContainer():
	value = coinsSold % maxCoins
	
