extends RigidBody2D

signal shoot

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _on_timer_timeout():
	if($VisibleOnScreenNotifier2D.is_on_screen()):
		shoot.emit()
