extends Effect

const speed: int = 900
var gained_speed: int

func tick():
	player.speed += speed
	gained_speed += speed
	super.tick()

func end():
	player.speed -= gained_speed
