extends Node2D

var duplicate_area: Area2D

func _ready() -> void:
	duplicate_area = $PrepArea1
	
	# Connect the _input function for all objects in the "object" group
	for obj in get_tree().get_nodes_in_group("object"):
		if obj is Node2D:
			obj.set_process_input(true)


func _on_object_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.pressed and mouse_event.button_index == MOUSE_BUTTON_RIGHT:
			duplicate_object(event.get_node() as Node2D)

func duplicate_object(original_object: Node2D) -> void:
	if not duplicate_area:
		printerr("Duplicate area not assigned or found.")
		return

	# Create a duplicate of the original object
	var duplicate = original_object.duplicate()

	# Check if the duplicate was created successfully
	if duplicate:
		duplicate.position = duplicate_area.global_position  # Set position in the duplicate area
		duplicate_area.add_child(duplicate)
	else:
		printerr("Failed to duplicate the original object.")
