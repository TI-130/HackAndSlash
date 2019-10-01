switch (state) {
	case "move":
		#region move state
		image_speed = 0.6;
		sprite_index = spr_ghoul_idle;
		
		if (instance_exists(obj_player)) {
			if	(abs(obj_player.x - x) < 200) {
				state = "chase";
				image_index = 0;
			} 
		}
		#endregion
		break;
		
	case "chase":
		#region chase state
		if (instance_exists(obj_player)) {
			if (abs(obj_player.x - x) > 200) {
				state = "move";	
				image_index = 0;
			}
			if (abs(obj_player.x - x) > 20) {
				scr_set_state_sprite(spr_ghoul_run, 1, 0);
				if (x - obj_player.x > 0) {
					image_xscale = 1;
					x = x - 2;
				} else if (x - obj_player.x < 0) {
					image_xscale = -1;
					x = x + 2;
				}
			}
		}
		
		if (instance_exists(obj_player)) {
			if (abs(obj_player.x - x) <= 20) {
				state = "attack";
				image_index = 0;
			}
		}
		#endregion
		break;
		
	case "attack":
		#region attack state
		scr_set_state_sprite(spr_ghoul_attack, 1, 0);
		scr_create_hurtbox(x, y, self, spr_ghoul_hitbox, 4, 4, 4, image_xscale);
		if (scr_animation_end()) {
			state = "move";
		}
		#endregion
		break;
}