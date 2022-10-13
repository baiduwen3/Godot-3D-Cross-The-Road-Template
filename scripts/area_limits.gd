extends Spatial

onready var get_auto = get_node("../scenario/autos/autos_left/auto")

func _ready():
	pass


func _on_right_area_lim_area_entered(area):
	print(area.name)
	if area.name == "auto":
#		get_auto.queue_free()
		pass
