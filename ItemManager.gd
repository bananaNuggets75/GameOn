extends Node

# This array will store the draggable items
var draggable_items : Array = []

# Function to add a draggable item to the array
func add_draggable_item(item):
	draggable_items.append(item)

# Function to remove a draggable item from the array
func remove_draggable_item(item):
	draggable_items.erase(draggable_items.find(item))

# Function to get the list of draggable items
func get_draggable_items():
	return draggable_items
