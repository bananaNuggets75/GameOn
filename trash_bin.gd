extends Node2D

var color_rect: ColorRect

func _ready() -> void:
	# Assuming you've added a ColorRect node named "ColorRect" as a child
	color_rect = $ColorRect

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("object"):
		color_rect.color = Color(1.0, 0.5, 0.5)  # Brighter red
		body.queue_free() 

# You can also handle area_entered if needed
func _on_Area2D_area_entered(area: Area2D) -> void:
	# Handle any additional logic when an area enters the trash bin
	pass
