extends Node2D

# Declare variables
var duplicate_area: Node2D
var cooking_area: Node2D
var finished_products_area: Node2D
var current_object: Node2D = null
var is_cooking: bool = false

func _ready() -> void:
	# Get the duplicate area node
	duplicate_area = get_node("/root/scene/duplicate_area")

	# Get the cooking area node
	cooking_area = get_node("/root/scene/cooking_area")

	# Get the finished products area node
	finished_products_area = get_node("/root/scene/finished_products_area")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton

		# If the player pressed the left mouse button and is not cooking, duplicate the object
		if mouse_event.pressed and mouse_event.button_index == MOUSE_BUTTON_LEFT and not is_cooking:
			var target_node = mouse_event.get_node()

			# Check if the object is a valid object to cook
			if target_node.is_in_group("valid_objects"):
				# Duplicate the object into the duplicate area
				var duplicate = target_node.duplicate()
				duplicate.position = duplicate_area.global_position
				duplicate_area.add_child(duplicate)

				# Set the current object to the duplicate
				current_object = duplicate

		# If the player pressed the right mouse button and is cooking, start preparing/cooking the object
		elif mouse_event.pressed and mouse_event.button_index == MOUSE_BUTTON_RIGHT and is_cooking:
			# Start preparing/cooking the object
			current_object.emit_signal("start_cooking")

func _process(delta: float) -> void:
	# If the current object is cooking and the cooking time has elapsed, move the object to the finished products area
	if is_cooking:
		current_object.cooking_time += delta

		if current_object.cooking_time >= current_object.cooking_duration:
			# Move the object to the finished products area
			finished_products_area.add_child(current_object)

			# Set the current object to null
			current_object = null

			# Stop cooking
			is_cooking = false
