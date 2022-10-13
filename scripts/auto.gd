extends Area



func _ready():
	pass
	
func _physics_process(delta):
	translate(Vector3(0,0,4) * delta)


func _on_auto_body_entered(body):
	if body.name == "player":
		print("Hit")
		get_tree().reload_current_scene()
