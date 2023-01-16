extends Node2D



func _ready():
	$CanvasLayer/VBoxContainer/Score.text = "You killed %d enemies"%GlobalVariables.kills


func _on_Exit_button_up():
	get_tree().quit()


func _on_TryAgain_button_up():
	GlobalVariables.reset()
	get_tree().change_scene("res://scenes/root.tscn")  # warning-ignore:return_value_discarded
