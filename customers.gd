extends Area2D

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Dropable"):
		var tween = get_tree().create_tween()
		tween.interpolate_property(body, "position", position, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		tween.connect("tween_completed", self)
		
func __call__(tween: Tween, object: Object, key: String) -> void:
	object.queue_free()
	var tween2 = get_tree().create_tween()
	tween2.interpolate_property(self, "position", Vector2(2000, 0), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween2.start()
	tween.connect("tween_completed", self, "_on_tween_completed")

