extends Node2D

var is_dragging = false

# Singleton instance
var global_instance = Global.new()

# Function to get the global instance
func _get_instance():
	return global_instance
