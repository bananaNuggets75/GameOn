extends StaticBody2D


func _ready():
	modulate = Color(Color.GRAY, 1)

func _process(delta):
	if Global.is_dragging:
		visible = true




