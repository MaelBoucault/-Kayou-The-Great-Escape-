var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

var center_x = cam_x + cam_w / 2;
var center_y = cam_y + cam_h / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(MainFront);
draw_text(center_x, center_y, "SCORE : " + string(global.final_score));