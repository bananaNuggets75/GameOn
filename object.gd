extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

func _ready() -> void:
	initialPos = position  # Store the initial local position

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false

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
		body.modulate = Color(Color.GREEN, 1)
		body_ref = body

func _on_area_2d_body_exited(body):
	if body.is_in_group('Dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.DARK_OLIVE_GREEN, 0.7)
		# Don't tween back to initial position; just stay where it exited
		position = global_position
