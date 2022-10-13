extends Spatial
#autos que aparecen de derecha

var auto_r
var auto_inst_r

func _ready():
	var material= SpatialMaterial.new()
	material.albedo_color= Color("#0cea34")
	material.emission_enabled = true
	material.emission = Color("#0cea34")
	material.emission_energy = 1.25	
	$auto2/MeshInstance.set_surface_material(0,material)


func _on_spawn_timer_timeout():
	auto_r = preload("res://assets/auto2.tscn").instance()
	auto_inst_r = auto_r	
	var material= SpatialMaterial.new()
	material.albedo_color= Color("#0cea34")
	material.emission_enabled = true
	material.emission = Color("#0cea34")
	material.emission_energy = 1.25		
	auto_inst_r.get_child(0).set_surface_material(0,material)
	add_child(auto_inst_r)
#	print(auto_inst_r.get_instance_id())
	


func _on_left_area_lim_area_entered(area):
	area.queue_free()
