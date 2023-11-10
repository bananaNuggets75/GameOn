extends Area2D

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("object"):
		# Assuming that the object has a "Draggable" script
		if body.has_method("_on_drag_and_drop"):
			body._on_drag_and_drop(global_position)
		else:
			body.queue_free()
	elif body.is_in_group("trashbin"):
		# The object entered the trash bin area
		if body.has_method("delete_object"):
			body.delete_object()
		else:
			body.queue_free()







