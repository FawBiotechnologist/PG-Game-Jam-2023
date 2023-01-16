extends KinematicBody2D
var speed = 200
var velocity = Vector2.ZERO
var can_shot = true


 # warning-ignore:return_value_discarded
func _physics_process(delta):
	calculate_input()
	move_and_collide(velocity * delta)


func calculate_input():
	velocity = Vector2.ZERO
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	GlobalVariables.player_pos = global_position


func _unhandled_input(event):
	if event.is_action_pressed("shot") and can_shot:
		#handle shotting
		EventBus.player_shotting($Sprite/Position2D.global_position, $Sprite/Position2D.rotation + rotation)
		can_shot = false
		$AudioStreamPlayer2D.play(0.0)
		$attackCooldown.start(0.5)


func _on_attackCooldown_timeout():
	can_shot = true


func _on_Area2D_body_entered(body):
	GlobalVariables.life -= 1
	body.collided_with_player()
	$playerGotHit.play(0.0)
	EventBus.player_hit()
	if GlobalVariables.life <= 0:
		EventBus.player_death()
