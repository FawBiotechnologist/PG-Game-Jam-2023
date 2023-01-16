extends CanvasLayer




func _ready():
	EventBus.connect("kill", self, "update_kills") # warning-ignore:return_value_discarded
	EventBus.connect("hit", self, "update_life") # warning-ignore:return_value_discarded
	update_kills()
	update_life()


func update_kills():
	$VBoxContainer/KillsControl/Kills.text = "Kill: " + str(GlobalVariables.kills)


func update_life():
	$VBoxContainer/LifesControl/Lifes.text = "Life: " + str(GlobalVariables.life)
