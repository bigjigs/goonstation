obj/effects/tatara
	var/obj/spark_generator/sparks = new/obj/spark_generator

	INIT()
		..()
		sparks.mouse_opacity = 0
		vis_contents += sparks
		sparks.particles.spawning = 0

	proc/spark_up()
		if(!ON_COOLDOWN(src,"spark_up",2.0 SECONDS))
			sparks.particles.spawning = 16
			playsound(src, "sound/impact_sounds/burn_sizzle.ogg", 30)
			SPAWN(1 SECONDS)
				sparks.particles.spawning = 0

obj/effects/welding
	appearance_flags = RESET_COLOR | RESET_ALPHA
	vis_flags = VIS_INHERIT_DIR
	var/emitters = list(new/obj/spark_generator, new/obj/spark_generator/flame)
	icon = 'icons/effects/fire.dmi'
	icon_state = "fire1"
	INIT(var/atom/newloc, var/dirn)
		..()
		for(var/obj/E in emitters)
			E.mouse_opacity = 0
			vis_contents += E
		src.add_simple_light("welding", list(0.94 * 255, 0.94 * 255, 0.94 * 255, 0.7 * 255))
		animate(simple_light, alpha=(0.6*255), loop=-1, time=6)
		animate(alpha=(0.3*255), time=3, easing=ELASTIC_EASING)
		animate(alpha=(0.7*255), time=3, easing=CUBIC_EASING)
		animate(time=7)
		animate(alpha=(0.5*255), time=3, easing=ELASTIC_EASING)
		animate(alpha=(0.7*255), time=3, easing=CUBIC_EASING)

		if(dirn)
			src.Turn(dir2angle(dirn))

	directed
		emitters = list(new/obj/spark_generator/directed, new/obj/spark_generator/flame)


obj/spark_generator
	particles = new/particles/spark
	plane = PLANE_NOSHADOW_ABOVE
	alpha = 200

	filters = list(type="bloom", threshold="#000", size=3, offset=2, alpha=1)

	flame
		filters = null
		particles = new/particles/spark/flame

	directed
		particles = new/particles/spark/directed


particles/spark
	width = 32     // 500 x 500 image to cover a moderately sized map
	height = 32
	count = 32    // 2500 particles
	spawning = 16
	bound1 = list(-40, -40, 0)
	bound2 = list(40, 40, 10)
	lifespan = 10  // live for 60s max
	fade = 5       // fade out over the last 3.5s if still on screen
	position = generator("sphere", 1, 2)
	gravity = list(0,0.2)
	friction = 0
	drift = generator("sphere", 1.5, 2, SQUARE_RAND)
	color = generator("color", "#ff5", "#f00")

	directed
		bound2 = list(40,5,10)
		fadein = 6
		position = generator("sphere", 1, 2)
		icon = 'icons/effects/particles.dmi'
		icon_state = list("streak"=5, ""=2)
		rotation = generator("num", -45, 45)
		spin = generator("num", -5, 5)
		velocity = generator("box", list(-1,-1,0), list(1,1,0))
		color = generator("color", "#ff5", "#f77")
		drift = generator("sphere", 0, 1, SQUARE_RAND)


	flame
		lifespan = 5  // live for 60s max
		fade = 2      // fade out over the last 3.5s if still on screen
		bound1 = list(-32, -32, -5)   // end particles at Y=-300
		bound2 = list(32, 32, 10)   // end particles at Y=-300
		friction = 0.05
		position = list(0,0,0) // spawn within a certain x,y,z space
		color = generator("color", "#fff", "#ffb")
		drift = generator("sphere", 0.2, 1)

/// firey embers, for use with burning_barrel
/particles/barrel_embers
	color = generator("color", "#FF2200", "#FF9933", UNIFORM_RAND)
	spawning = 0.5
	count = 30
	lifespan = 30
	fade = 5
	position = generator("vector", list(-3,6,0), list(3,6,0), NORMAL_RAND)
	gravity = list(0, 0.2, 0)
	color_change = 0
	friction = 0.2
	drift = generator("vector", list(0.25,0,0), list(-0.25,0,0), UNIFORM_RAND)
	fadein = 10

/particles/barrel_smoke
	icon = 'icons/effects/64x64.dmi'
	icon_state = list("smoke_static")
	color = "#2222225A"
	height = 200
	spawning = 0.08
	count = 3
	lifespan = 2 SECONDS
	fade = 1 SECOND
	position = generator("vector", list(-2,8,0), list(2,8,0), NORMAL_RAND)
	gravity = list(0, 0.3, 0)
	scale = list(0.1, 0.1)
	rotation = generator("num", -90, 90, NORMAL_RAND)
	spin = generator("num", -5, 5, UNIFORM_RAND)
	grow = list(0.05, 0.05)
	fadein = 0.2 SECONDS

/particles/arcfiend
	color = generator("color", "#ff9900", "#ffff00", NORMAL_RAND)
	width = 200
	height = 200
	spawning = 5
	count = 200
	lifespan = 10
	fade = 10
	position = generator("circle", 0, 64, NORMAL_RAND)
	friction = generator("num", 0, 0, NORMAL_RAND)
	drift = generator("box", list(-0.1,-0.1,0), list(0.1,0.1,0), UNIFORM_RAND)

/particles/stink_lines
	icon = 'icons/effects/particles.dmi'
	icon_state = list("line")
	color = generator("color", "#808000", "#806900", NORMAL_RAND)
	spawning = 0.3
	lifespan = 30
	fade = 10
	fadein = 10
	position = generator("circle", 10, 12, NORMAL_RAND)
	friction = generator("num", 0.1, 0.3, NORMAL_RAND)
	drift = generator("box", list(0.1,0.05,0), list(-0.1,0,0), UNIFORM_RAND)
	rotation = generator("num", -45, 45, UNIFORM_RAND)
