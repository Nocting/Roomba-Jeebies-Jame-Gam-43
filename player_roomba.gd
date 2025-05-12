extends CharacterBody2D

@export var speed:int = 100

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
	
	pass
