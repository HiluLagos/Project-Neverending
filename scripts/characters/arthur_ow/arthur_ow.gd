extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const max_speed: int = 80
const acceleration: int = 2
const friction: int = 12

func _physics_process(delta: float) -> void:
		# Vector is normalized so movement in a diagonal x;y axis is the same pixels 
		# as only x and only y
	
		var input = Vector2(
			Input.get_action_strength("right") - Input.get_action_strength("left"),
			Input.get_action_strength("down") - Input.get_action_strength("up")
		).normalized()
		
		if input.length() > 0:  # Ensure there is movement
			
			if abs(input.x) > abs(input.y):  # (x is dominant)
				#flip image
				animated_sprite.play("walk_left_right")
			elif input.y < 0:  # (negative y)
				animated_sprite.play("walk_back")
			elif input.y > 0:  # Downward movement (positive y)
				animated_sprite.play("walk_front")
				
		else:
			pass
		
		
		var lerp_weight = delta * (acceleration if input else friction)
		velocity = lerp(velocity, input *max_speed, lerp_weight)
		move_and_slide()
