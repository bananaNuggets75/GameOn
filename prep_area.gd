extends Node2D

var duplicate_area: Node2D

func _ready() -> void:
	duplicate_area = $/root/stall/PrepArea1

	# Set up input processing for all objects in the "object" group
	for obj in get_tree().get_nodes_in_group("object"):
		if obj is Node2D:
			obj.set_process_input(true)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton


func duplicate_object(original_object: Node2D) -> void:
	if not duplicate_area:
		printerr("Duplicate area not assigned or found.")
		return

	# Check if the original object is a member of the "object" group
	if not original_object.is_in_group("object"):
		printerr("Original object is not in the 'object' group.")
		return

	# Create a duplicate of the original object
	var duplicate = original_object.duplicate()

	# Check if the duplicate was created successfully
	if duplicate:
		duplicate.position = duplicate_area.global_position  # Set position in the duplicate area
		duplicate_area.add_child(duplicate)  # Add the duplicate to the scene
	else:
		printerr("Failed to duplicate the original object.")
