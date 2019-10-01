scr_get_input();
// script_execute(state_script);


switch (state) {
	case "move":
		#region move state
		image_speed = 0.6;
		if (right_key) {
			scr_move_and_collide(4, 0);
			image_xscale = 1;
			sprite_index = spr_player_run;
		}
		
		if (left_key) {
			scr_move_and_collide(-4, 0);
			image_xscale = -1;
			sprite_index = spr_player_run;
		}
		
		if (!right_key && !left_key) {
			sprite_index = spr_player_idle;
		}
		
		if (slide_key && sprite_index != spr_player_idle) {
			state = "slide";
			image_index = 0;
		}
		
		if (attack_key_press) {
			state = "attack1";
			image_index = 0;
		}
		#endregion
		break;
		
	case "slide":
		#region slide state
		scr_set_state_sprite(spr_player_slide, 1, 0);
		fix_xscale = image_xscale;
		scr_move_and_collide(fix_xscale * 6, 0);
		if (scr_animation_end()) {
			state = "move";	
		}
		#endregion
		break;
		
	case "attack1":
		#region attack1 state
		scr_set_state_sprite(spr_player_attack_one, 1, 0);
		
		if (scr_animation_hit_frame(2)) {
			scr_create_hurtbox(x, y, self, spr_player_hurtbox_one, 4, 4, 1, image_xscale);
		}
		
		if (attack_key && scr_animation_hit_index_range(3,4)) {
			state = "attack2";
		}
		
		if (scr_animation_end()) {
			state = "move";	
		}
		
		#endregion
		break;
		
	case "attack2":
		#region attack2 state
		scr_set_state_sprite(spr_player_attack_two, 1, 0);
		if (scr_animation_hit_frame(3))
		{
			scr_create_hurtbox(x, y, self, spr_player_hurtbox_two, 4, 4, 1, image_xscale);
		}
		if (attack_key && scr_animation_hit_index_range(4,5)) {
			state = "attack3";
			image_index = 0;
		}
		
		if (scr_animation_end()) {
			state = "move";	
		}
		
		#endregion
		break;
		
	case "attack3":
		#region attack3 state
		scr_set_state_sprite(spr_player_attack_three, 1, 0);
		if (scr_animation_hit_frame(2))
		{
			scr_create_hurtbox(x, y, self, spr_player_hurtbox_two, 4, 4, 1, image_xscale);
		}
		if (scr_animation_end()) {
			state = "move";	
		}
		#endregion
		break;
	
}