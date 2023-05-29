extends RigidBody2D

var velocity = Vector2(0, 0)
var speed = 200

func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
