extends Area2D

var is_inside_trash = false

func _ready():
	modulate = Color(Color.DARK_RED, 0.7)
# Called when an object enters the trash bin area

func _process(delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false

func _on_Area2D_body_entered(body: Node) -> void:
	if body is Object:  # Replace with the actual object type you want to delete
		body.queue_free()  # Remove the object from the scene

# You can also handle area_entered if needed
func _on_Area2D_area_entered(area: Area2D) -> void:
	# Handle any additional logic when an area enters the trash bin
	pass
