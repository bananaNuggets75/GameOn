extends Node

class_name Player

var prepared_color : String = ""
var preparation_area_ready : bool = false

func prepare_food(color):
	if prepared_color == "":
		prepared_color = color
		preparation_area_ready = true
		print("Preparing " + color + " color...")

func _process(delta):
	if preparation_area_ready:
		print("Preparation area ready to serve " + prepared_color + " color.")
