extends Node

@export var mob_scene: PackedScene
@export var bullet_scene: PackedScene
var score

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready...")
	get_tree().call_group("mobs", "queue_free")
	

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	var direction = mob_spawn_location.rotation + PI / 2
	
	mob.position = mob_spawn_location.position
	
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	var slow_velocity = Vector2(randf_range(50.0, 80.0), 0.0)
	var rand = randi() % 3
	
	if(rand == 2):
		mob.linear_velocity = slow_velocity.rotated(direction)
	else:
		mob.linear_velocity = velocity.rotated(direction)
	# shift between different speeds in the game

	
	mob.shoot.connect(_on_shoot_signal.bind(mob))
	add_child(mob)



func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_shoot_signal(mob):
	var bullet = bullet_scene.instantiate()
	
	bullet.position = mob.global_position
	bullet.velocity = $Player.global_position - bullet.position
	add_child(bullet)


