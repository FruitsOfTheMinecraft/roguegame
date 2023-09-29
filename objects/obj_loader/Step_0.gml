
if processes[@0] and not processes[@1] {
	
	var items = array_length(global.rooms)
	
	for (var i = 0; i < items; ++i) {
	    
		var item = global.rooms[@i]
		
		var flag = 0
		
		// up
		if item.data[@6] and item.data[@7] and item.data[@8] and item.data[@9] {
			flag += 1
		}
		
		// right
		if item.data[@15+(6*16)] and item.data[@15+(7*16)] and item.data[@15+(8*16)] and item.data[@15+(9*16)] {
			flag += 2
		}
		
		// down
		if item.data[@6+(15*16)] and item.data[@7+(15*16)] and item.data[@8+(15*16)] and item.data[@9+(15*16)] {
			flag += 4
		}
		
		// left
		if item.data[@6*16] and item.data[@7*16] and item.data[@8*16] and item.data[@9*16] {
			flag += 8
		}
		
		global.rooms[@i].connection_flags = flag
		
	}
	
	processes[@1] = true
	
}

if processes[@0] and processes[@1] {
	
	var items = array_length(global.rooms)
	
	if items > 0 {
		
		if keyboard_check_pressed(vk_up) {selected_map = (selected_map + 1) mod items}
		if keyboard_check_pressed(vk_down) {selected_map = (selected_map - 1 + items) mod items}
		
	}
	
}





if keyboard_check_pressed(vk_enter) {
	show_debug_message(global.rooms[@selected_map])
}

//if keyboard_check_pressed(ord("S")) {
//	if buffer_exists(buffer) {buffer_delete(buffer)}
//	buffer = buffer_create(16 * 16 * 4, buffer_fixed, 1);
//	buffer_get_surface(buffer, my_surface, 0);
//}
