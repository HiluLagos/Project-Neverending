extends Camera2D

@onready var arthur_ow: CharacterBody2D = $"../Arthur_ow"

func _physics_process(delta: float) -> void:
	#Camera position set to follow the player
	position = lerp(position,arthur_ow.position, 5*delta)
