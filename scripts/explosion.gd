extends Node2D



func _ready():
	$Particles2D.restart()
	$Particles2D.emitting = true


func _on_Timer_timeout():
	queue_free()


