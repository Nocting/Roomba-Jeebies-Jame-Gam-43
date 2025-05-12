class_name Player extends Area2D

@export var speed: float = 100.00
@export var hp: int = 10

var in_house_ui = false
var house: House

signal feeding(player: Player)

func _process(delta: float) -> void:
	move()
	pass
	
func move():
	var delta:float = get_process_delta_time()
	if(Input.is_action_pressed("move_up")):
		self.position.y -= speed * delta
		
	if(Input.is_action_pressed("move_down")):
		self.position.y += speed * delta
		
	if(Input.is_action_pressed("move_right")):
		self.position.x += speed * delta
		
	if(Input.is_action_pressed("move_left")):
		self.position.x -= speed * delta
	
	if(Input.is_action_pressed("deposit") and in_house_ui):
		feeding.emit(self)
	pass


func _on_house_entered(area: House) -> void:
	in_house_ui = !in_house_ui
	house = area
	pass # Replace with function body.


func _on_house_exited(area: House) -> void:
	in_house_ui = !in_house_ui
	house = null
	pass # Replace with function body.
