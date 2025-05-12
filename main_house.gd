class_name House extends Area2D


var current_progress: float  = 0.00
const max_progress: float = 512.00
var ratio_of_progress: float = (current_progress/max_progress)
func _ready() -> void:
	current_progress = 0.00
	
## THIS SHOULD BE IN A SIGNAL INSTEAD BUT FOR THE PURPOSES OF THIS GAMEJAM NO OPTIMIZATION ASNMJDBNAHDIABDH
func _process(delta: float) -> void:
	ratio_of_progress = (current_progress/max_progress)
	if (ratio_of_progress == 1):
		return
	if (ratio_of_progress >= 0.875):
		return
	if (ratio_of_progress >= 0.75):
		return
	if (ratio_of_progress >= 0.625):
		return
	if (ratio_of_progress >= 0.5):
		return
	if (ratio_of_progress >= 0.375):
		return
	if (ratio_of_progress >= 0.250):
		return
	if (ratio_of_progress >= 0.125):
		return
	if (ratio_of_progress >= 0):
		return
		
		
	pass

func _on_main_scene_house_increase() -> void:
	current_progress += 1
	print(current_progress)
	pass # Replace with function body.
