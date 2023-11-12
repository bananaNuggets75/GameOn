extends Node2D

var draggable = false
var is_inside_dropable = false
var is_inside_trashbin = false
var trashed = false
var has_item = false
var body_ref
var offset: Vector2
var initialPos: Vector2

func _ready() -> void:
	initialPos = position  # Store the initial local position

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Dropable"):
		is_inside_dropable = true
		body_ref = body
	elif body.is_in_group("trashbin"):
		is_inside_trashbin = true
		body.modulate = Color(Color.RED, 1)
		body_ref = body

func _on_Area2D_body_exited(body):
	if body.is_in_group('Dropable'):
		is_inside_dropable = false
	elif body.is_in_group("trashbin"):
		is_inside_trashbin = false

func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group('Dropable'):
		is_inside_dropable = true
		body_ref = body
		has_item = true
	elif body.is_in_group('trashbin'):
		trashed = true
		body_ref = body

func _on_area_2d_body_exited(body: StaticBody2D):
	if body.is_in_group('Dropable'):
		is_inside_dropable = false
	elif body.is_in_group('trashbin'):
		trashed = false

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false

			if is_inside_dropable:
				body_ref.queue_free()
				var new_node = self.duplicate()
				new_node.position = initialPos
				get_parent().add_child(new_node)
				
				# Hide the static2dbody when item is dropped in the dropable area
				

			elif trashed:
				queue_free()
	elif has_item:
		queue_free()


				
