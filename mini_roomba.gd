extends Area2D

signal now_following(own_area, target_area)

var cur_following = false
@export var target: Area2D

func _process(delta: float) -> void:
	if(cur_following == true):
		self.position = self.position.lerp(target.position - Vector2(randi_range(0, 10), randi_range(0, 10)), delta)	
	pass


func _on_area_entered(area: Area2D) -> void:
	if(cur_following == false):
		now_following.emit(self, area)
	pass # Replace with function body.aw
