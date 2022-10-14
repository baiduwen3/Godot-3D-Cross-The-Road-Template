extends Spatial


onready var m_cnt_light = $mini_container/cnt_state_light
onready var m_cnt_light2 = $mini_container2/cnt_state_light

onready var clmn_btn = $columns/trg_column/trg_button
onready var clmn_btn2 = $columns/trg_column2/trg_button2

func _ready():
	pass
	

func _on_action_sensor_body_entered(body):
	if body.name == "player":
		print("player esta en sensor 1")
		$"3d_text/tx_Mesh".visible = true
		$Timer_rgt.start()
		

func _on_Timer_rgt_timeout():
	if Input.is_action_just_pressed("action"):
			print("e presionado sn1")
			$mini_container/open_door_anim.play("open_door_anim")
			var material= SpatialMaterial.new()
			material.albedo_color= Color("#0cea34")
			material.emission_enabled = true
			material.emission = Color("#0cea34")
			material.emission_energy = 4	
			clmn_btn.set_surface_material(0,material)
			clmn_btn.translation.z = 1.1
			m_cnt_light.set_surface_material(0,material)
			
			$columns/trg_column/action_sensor.set_collision_layer_bit(0,false)
			$columns/trg_column/action_sensor.set_collision_mask_bit(0,false)
#			$Timer_rgt.stop()


func _on_action_sensor_body_exited(body):
	if body.name == "player":
		$"3d_text/tx_Mesh".visible = false
		$Timer_rgt.stop()


func _on_action_sensor2_body_entered(body):
	if body.name == "player":
		print("player esta en sensor 2")
		$"3d_text/tx_Mesh2".visible = true
		$Timer_lft.start()


func _on_Timer_lft_timeout():
	if Input.is_action_just_pressed("action"):
		print("e presionado sn2")
		$mini_container2/open_door_anim2.play("open_door_anim2")
		var material2= SpatialMaterial.new()
		material2.albedo_color= Color("#0cea34")
		material2.emission_enabled = true
		material2.emission = Color("#0cea34")
		material2.emission_energy = 4	
		clmn_btn2.set_surface_material(0,material2)
		clmn_btn2.translation.z = 1.1
		m_cnt_light2.set_surface_material(0,material2)		
	
		$columns/trg_column2/action_sensor2.set_collision_layer_bit(0,false)
		$columns/trg_column2/action_sensor2.set_collision_mask_bit(0,false)


func _on_action_sensor2_body_exited(body):
	if body.name == "player":
		$"3d_text/tx_Mesh2".visible = false
		$Timer_lft.stop()


func _on_cnt_snr_area_body_entered(body):
	if body.name=="player":
		$mini_container/player_mesh_pose.visible = true
		$"../../player/Camera".current = false
		$"../../containers_camera".current = true
		$mini_container/open_door_anim.play_backwards("open_door_anim")
		$"../../player".global_transform.origin = $"../../positions/initial_position".global_transform.origin
		$"../../player".cinematic_state = true
		var yellow_mat= SpatialMaterial.new()
		yellow_mat.albedo_color= Color("#ffcd02")
		yellow_mat.emission_enabled = true
		yellow_mat.emission = Color("#ffcd02")
		yellow_mat.emission_energy = 4	
		clmn_btn.set_surface_material(0,yellow_mat)
		m_cnt_light.set_surface_material(0,yellow_mat)


func _on_open_door_anim_animation_finished(anim_name):
	$"../../player/Camera".current = true
	$"../../containers_camera".current = false
	$"../../player".cinematic_state = false
