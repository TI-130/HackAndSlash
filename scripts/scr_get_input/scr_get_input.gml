/// src_get_input
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
//up_key = keyboard_check(vk_up);
//down_key = keyboard_check(vk_down);

slide_key = keyboard_check(vk_shift);
attack_key = keyboard_check(ord("F"));
attack_key_press = keyboard_check_pressed(ord("F"));


if (gamepad_is_connected(0)) {
	gamepad_set_axis_deadzone(0, .35);
	right_key = gamepad_axis_value(0, gp_axislh) > 0;
	left_key =  gamepad_axis_value(0, gp_axislh) < 0;
	//up_key = gamepad_axis_value(0, gp_axislv) > 0;
	//down_key =  gamepad_axis_value(0, gp_axislv) < 0;

	slide_key = gamepad_button_check(0, gp_face1);
	attack_key = gamepad_button_check(0, gp_face2);
	attack_key_press = gamepad_button_check_pressed(0, gp_face2);
}
