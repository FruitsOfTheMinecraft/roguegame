
if keyboard_check_pressed(vk_tab) {
	
	if array_length(open) > 0 {
		
		var index = irandom(array_length(open) - 1)
		var room_coords = open[@index]
		array_delete(open, index, 1)
		
		var rx = room_coords[@0]
		var ry = room_coords[@1]
		
		if not closed[@rx][@ry] {
			//var this_roomtile = rooms_data[@room_coords[@0]][@room_coords[@1]]
			
			room_selector(rx, ry)
			closed[@rx][@ry] = true
			
			var dirs = [[0, -1], [1, 0], [0, 1], [-1, 0]]
			
			for (var i = 0; i < 4; ++i) {
				
				if rooms_data[@rx][@ry] & power(2,i) {
					
					var rxx = rx + dirs[@i][@0]
					var ryy = ry + dirs[@i][@1]
				
					if rxx >= 0 and rxx < rooms_width and ryy >= 0 and ryy < rooms_height {
						if not value_in_list([rxx, ryy], open) {
							array_push(open, [rxx, ryy])
						}
					}
				
				}
				
			}
			
		}
		
	}
	
	show_debug_message(open)
	show_debug_message(closed)
	
}
