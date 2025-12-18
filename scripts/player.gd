extends CharacterBody2D

#defines varibles
var player_health = 100
var alive = true
var can_eat = true
@export var speed= 500
@export var rotation_speed = 15

var rotation_direction = 0
#calls animated sprite node
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

#func runs while the game runs
func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x*Input.get_axis("up","down,right,left")*speed
	
func _physics_process(delta):
	get_input()
	rotation += rotation_direction*rotation_speed*delta
	move_and_slide()
	

'func _process(_delta):
	
	# gets
	var direction = Input.get_vector("left", "right","up","down")
	if direction.x > 0:
		animated_sprite.flip_h = false
	if direction.x<0:
		animated_sprite.flip_h= true
	if direction.y > 0:
		animated_sprite.flip_v = false
	
		
	#if direction.y <0:
		#animated_sprite.rotation_degrees=
		
		
	if alive:
		velocity = direction*500
		move_and_slide()
	
	if alive and can_eat:
		if !velocity:  
			animated_sprite.play("idle")
		if velocity:
			animated_sprite.play("moving")'
	
			
			
	#if Input.is_action_pressed("pick_up") and can_eat:
		#animated_sprite.play("piking up item")
		#can_eat = false
		#$eatTimer.start()
		#
	#if alive and player_health<=0:
		#animated_sprite.play("death")
		#alive = false
		#$deathTimer.start()
	
#func _on_eat_timer_timeout() -> void:
	#can_eat = true
#
#func _on_death_timer_timeout() -> void:
	#if !alive:
		#get_tree().change_scene_to_file("res://death_screen.tscn")

#func apply_damage(amount: int) -> void:
	## Reduce player health and handle death logic centrally
	#if not alive:
		#return
	#player_health -= amount
	#print("Player hit, health = ", player_health)
	#if player_health <= 0:
		#player_health = 0
		#alive = false
		#animated_sprite.play("death")
		## start the death timer if present
		#if has_node("deathTimer"):
			#$deathTimer.start()
