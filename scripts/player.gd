extends KinematicBody



var vec_pos = Vector3(0,0,0)
var speed = 420
var gravity= -4
var jump_force = 60

var cinematic_state = false

func _ready():
	pass

func _physics_process(delta):
	
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("idle")
		
	if  vec_pos.y >60:
#		print(vec_pos.y, "mayor a 60")
		vec_pos.y = 30
		jump_force = 0
	else:
		jump_force = 60
		
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		vec_pos.x=0
	elif Input.is_action_just_pressed("ui_right") and is_on_floor():
		$Armature/Skeleton/Cube.rotation_degrees.y = -90
		$AnimationPlayer.stop()
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("movement_jump")
			vec_pos.x=speed
			vec_pos.y = jump_force
			
	elif Input.is_action_just_pressed("ui_left") and is_on_floor():
		$Armature/Skeleton/Cube.rotation_degrees.y = 90
		$AnimationPlayer.stop()
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("movement_jump")
			vec_pos.x=-speed
			vec_pos.y = jump_force
		
	else:
		vec_pos.x= lerp(vec_pos.x,0,0.4)
		
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		vec_pos.z=0
	elif Input.is_action_just_pressed("ui_up") and is_on_floor():
		$Armature/Skeleton/Cube.rotation_degrees.y = 0		
		$AnimationPlayer.stop()
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("movement_jump")
			vec_pos.z=-speed
			vec_pos.y = jump_force
				
		
	elif Input.is_action_just_pressed("ui_down") and is_on_floor():
		$Armature/Skeleton/Cube.rotation_degrees.y = 180
		$AnimationPlayer.stop()
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("movement_jump")
			vec_pos.z=speed
			vec_pos.y = jump_force
				
		
	else:
		vec_pos.z= lerp(vec_pos.z,0,0.4)
		pass
	
	if cinematic_state == true:
		vec_pos.z = 0 
		vec_pos.x = 0
		vec_pos.y = 0
		jump_force = 0
		$AnimationPlayer.stop()
		$Armature/Skeleton/Cube.rotation_degrees.y = 0	
	
	vec_pos.y += gravity
		
	vec_pos = move_and_slide(vec_pos,Vector3.UP)
