extends Node

signal shot(position, direction)
signal kill
signal death
signal hit

func player_shotting(position, direction):
	emit_signal("shot", position, direction)

func player_kill():
	emit_signal("kill")
	
func player_death():
	emit_signal("death")
	
func player_hit():
	emit_signal("hit")
