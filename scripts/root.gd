extends Node2D
onready var projectile_reference = preload("res://scenes/projectile.tscn")
onready var enemy = preload("res://scenes/enemy.tscn")
var rng = RandomNumberGenerator.new()



func _ready():
	EventBus.connect("shot", self, "on_player_shot")# warning-ignore:return_value_discarded
	EventBus.connect("death", self, "on_player_death")# warning-ignore:return_value_discarded
	rng.randomize()
	$Timer.wait_time = rng.randf_range(0.1, 1)


func on_player_shot(pos, dir):
	var projectile = projectile_reference.instance()
	projectile.initialize_projectile(pos, dir)
	add_child(projectile)

func spawn_enemy():
	for _i in range(rng.randi_range(1,5)): 
		$map/Path2D/PathFollow2D.set_offset(randi())
		var new_enemy = enemy.instance()
		new_enemy.position = $map/Path2D/PathFollow2D.position
		add_child(new_enemy)
	$Timer.wait_time = rng.randf_range(0.1, 4)
	$Timer.start()


func _on_Timer_timeout():
	spawn_enemy()

func on_player_death():
	get_tree().change_scene("res://scenes/game_over.tscn") # warning-ignore:return_value_discarded
