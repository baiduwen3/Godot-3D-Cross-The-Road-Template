extends Spatial


onready var m_cnt_light = $mini_container/cnt_state_light
onready var m_cnt_light2 = $mini_container2/cnt_state_light

onready var clmn_btn = $columns/trg_column/trg_button
onready var clmn_btn2 = $columns/trg_column2/trg_button2

func _ready():
	pass
	

func _on_action_sensor_body_entered(body):
	if body.name == "player":
		print("player esta")
		$"3d_text/tx_Mesh".visible = true
		$Timer_rgt.start()
		

func _on_Timer_rgt_timeout():
	if Input.is_action_just_pressed("action"):
			print("e presionado")
			$mini_container/open_door_anim.play("open_door_anim")
			var material= SpatialMaterial.new()
			material.albedo_color= Color("#0cea34")
			material.emission_enabled = true
			material.emission = Color("#0cea34")
			material.emission_energy = 4	
			clmn_btn.set_surface_material(0,material)
			m_cnt_light.set_surface_material(0,material)
			
			$columns/trg_column/action_sensor.set_collision_layer_bit(0,false)
			$columns/trg_column/action_sensor.set_collision_mask_bit(0,false)
#			$Timer_rgt.stop()


func _on_action_sensor_body_exited(body):
	if body.name == "player":
		$"3d_text/tx_Mesh".visible = false
		$Timer_rgt.stop()
