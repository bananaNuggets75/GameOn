extends AnimatedSprite2D

var enter_animation_name = "OpenTrash"
var exit_animation_name = "CloseTrash"

func _on_Area2D_body_entered(body):
	if body.is_in_group("trashbin"):
		# The object entered the trash bin area
		queue_free()
		animation = enter_animation_name
		play()

func _on_Area2D_body_exited(body):
	if body.is_in_group("trashbin"):
		# The object exited the trash bin area
		# You can add any specific logic here if needed
		animation = exit_animation_name
		play()
