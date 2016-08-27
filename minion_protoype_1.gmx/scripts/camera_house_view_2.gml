view_yview[1] = 480

view_xview[1] += ((object_player.x-((view_wview[1])/2)) - view_xview[1]) * 0.2

if (view_xview[1] >= (432 + view_hview[1])) {
    view_xview[1] = 432 + view_hview[1]
}
