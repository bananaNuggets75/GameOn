extends Node

class_name Player

var prepared_color : String = ""    # this will check if the preparation area is clear
var preparation_area_ready : bool = false
var player_wallet : int = 0  # Add a variable to track money collected
var goal : int = 100  # Set a goal amount to reach

# Function to handle color preparation and customer service
func serve_customer(customer_choice):
	if customer_choice == prepared_color:
		print("Serving customer with " + prepared_color + " color.")
		# Collect money and check if the goal is reached
		collect_money(50)  # Adjust the payment based on your game's logic
		# this needs to base on the customer. we do not need to collect a specified money so this needs to be changed 
		check_goal()

	else:
		print("Customer wanted " + customer_choice + " color. Preparing...")
		prepare_food(customer_choice)

func prepare_food(color):
	if prepared_color == "":
		prepared_color = color
		preparation_area_ready = true
		print("Preparing " + color + " color...")
	else:
		print("Preparation area is busy. Can't prepare " + color + " color.")
		# i think this should be like something we cannot proceed since there are only 6 limits 

# Function to handle impatience and cleanup
func customer_leave_due_to_impatience():
	if preparation_area_ready:
		# print("Customer left due to impatience.")
		# Update the prepared_color to reflect throwing away the order
		prepared_color = ""
		preparation_area_ready = false

# Function to collect money and check if the goal is reached
func collect_money(payment):
	player_wallet += payment
	print("Collected " + str(payment) + ". Total: " + str(player_wallet) + " pesos.")

# this will keep track your wallet if you already won or not, but this is actually not necessary to print
# if the you won or not because you will know it once the customer runs out. 
func check_goal():
	if player_wallet >= goal:
		print("Goal reached! You win!")
		# Implement logic for winning the game (e.g., show a win screen)
	else:
		# Check if the customer has run out and the quota is not met
		if customer_run_out() and player_wallet < goal:
			print("Customer ran out. You lose! ")
			# Implement logic for losing the game (e.g., show a lose screen)

# Function to check if the customer has run out
func customer_run_out() -> bool:
	# Implement your logic to determine if the customer has run out
	# For example, check if a certain number of customers have left
	return true  # Replace this with your actual logic



func _on_area_2d_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	pass # Replace with function body.


func _on_area_2d_mouse_entered():
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	pass # Replace with function body.
