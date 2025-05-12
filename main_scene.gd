extends Node2D 

@onready var follow_container = $"Follow Container"
@onready var mini_container = $"Mini Container"

@onready var mini_roomba = preload("res://mini_roomba.tscn")

var first_roomba = true


signal house_increase 

func _ready():
	for x in range(512):
		var  new_mini_roomba = mini_roomba.instantiate()
		new_mini_roomba.position = Vector2(randf_range(0, 250), randf_range(0, 250))
		mini_container.add_child(new_mini_roomba)
		var newba = mini_container.get_child(-1)
		newba.connect("now_following", _on_mini_roomba_now_following)

func _on_mini_roomba_now_following(mini_roomba, player_roomba):
	if(first_roomba == true):
		mini_roomba.target = player_roomba
		first_roomba = false
		mini_roomba.reparent($"Follow Container")
		mini_roomba.cur_following = true
	else:
		if(follow_container.get_child_count() < follow_container.capacity):
			mini_roomba.target = follow_container.get_child(-1)
			mini_roomba.reparent($"Follow Container")
			mini_roomba.cur_following = true
	pass # Replace with function body.


func _on_player_roomba_feeding(player) -> void:
	if(follow_container.get_child_count() >= 1):
		follow_container.remove_child(follow_container.get_child(0))
		if(follow_container.get_child_count() != 0):
			follow_container.get_child(0).target = player
		house_increase.emit()
	if(follow_container.get_child_count() == 0):
		first_roomba = true
