extends Area2D

var speed = 400
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.
	
func initialize_projectile(pos, dir):
	position = pos
	velocity = Vector2(speed, 0).rotated(dir)
	rotation = dir
	
func _physics_process(delta):
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free() 
