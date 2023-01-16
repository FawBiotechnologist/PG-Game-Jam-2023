extends KinematicBody2D

var speed = 100
var velocity = Vector2.ZERO
onready var explosion_scene = preload("res://scenes/explosion.tscn")



func _physics_process(delta):
	velocity = position.direction_to(GlobalVariables.player_pos)
	move_and_collide(velocity * (speed + GlobalVariables.kills) * delta)  # warning-ignore:return_value_discarded
	look_at(GlobalVariables.player_pos)

func _on_Area2D_area_entered(area):
	if GlobalVariables.kills > 20:
		area.queue_free()
	GlobalVariables.kills += 1
	EventBus.player_kill()
	var explosion = explosion_scene.instance()
	explosion.global_position = global_position
	get_parent().add_child(explosion)
	queue_free()

func collided_with_player():
	queue_free()

