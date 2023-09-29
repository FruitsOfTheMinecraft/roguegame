


if processes[@0] {
	
	var image_map = global.rooms[@selected_map]
	
	for (var i = 0; i < image_map.width; ++i) {
		for (var k = 0; k < image_map.height; ++k) {
			
			var index = i + (k * image_map.width)
			
			draw_set_color(image_map.data[@index])
			draw_rectangle(i, k, i, k ,false)
			
		}
	}
	
	draw_set_color(c_white)
	draw_text(4, 32, string(selected_map))
	
	if processes[@1] {
		draw_text(4, 64, string(global.rooms[@selected_map].connection_flags))
	}
	
}
else {
	
	var first_time = true
	
	while (true) {
		
		var this_file = noone
		
		if first_time {
			this_file = file_find_first(working_directory + "*.png", fa_directory);
			first_time = false
		}
		else {
			this_file = file_find_next();
		}
		
		
		
		if file_exists(this_file) {
			
			show_debug_message("loading file <"+this_file+">")
			
			var spr = sprite_add(this_file, 0, false, false, 0, 0)
			
			var width = sprite_get_width(spr)
			var height = sprite_get_height(spr)
			
			var surface = surface_create(width, height);
			surface_set_target(surface);
			
			draw_clear_alpha(c_black, 0)
			draw_sprite(spr, 0, 0, 0)
			
			var buffer = buffer_create(4 * width * height, buffer_fast, 1);
			
			// magic function
			buffer_get_surface(buffer, surface, 0);
			
			var struct = imgmap_struct(buffer_to_colordata(buffer), width, height, this_file)
			array_push(global.rooms, struct)
			
			buffer_delete(buffer)
			sprite_delete(spr)
			surface_reset_target()
			surface_free(surface)
			
		}
		else {
			//show_debug_message(my_loaded_things)
			break
		}
			
	}
	
	processes[@0] = true
	
}


