extends Spatial
#autos que aparecen de izquierda

#var auto = preload("res://assets/auto.tscn").instance()
var auto
var auto_inst

func _ready():
	pass


func _on_spawn_timer_timeout():
#	var auto = preload("res://assets/auto.tscn").instance()
#	var auto_inst = auto
	auto = preload("res://assets/auto.tscn").instance()
	auto_inst = auto
	add_child(auto_inst)
#	print(auto.get_instance_id())


func _on_right_area_lim_area_entered(area):
	area.queue_free()
	
