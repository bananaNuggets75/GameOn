extends Node2D

var trash_bin_area: Area2D

func _ready() -> void:
	# Get the trash bin area node
	trash_bin_area = get_node("/root/trash_bin")

	# Set up input processing for all objects in the "object" group
	for obj in get_tree().get_nodes_in_group("object"):
		if obj is Node2D:
			obj.set_process_input(true)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.pressed and mouse_event.button_index == MOUSE_BUTTON_RIGHT:
			var target_node = event.get_node()

			# Check if the object is dropped in the trash bin area
			if target_node in trash_bin_area.get_children():
				# Delete the object
				target_node.queue_delete()







