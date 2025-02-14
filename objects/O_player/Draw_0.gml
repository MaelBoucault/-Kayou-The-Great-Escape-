draw_set_font(MainFront);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(camera_get_view_x(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + 10, "Vies: " + string(global.player_lives));

draw_set_halign(fa_right);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + 10, "Pieces: " + string(global.coins_collected));

draw_self();