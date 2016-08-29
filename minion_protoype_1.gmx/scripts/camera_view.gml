//argument 0 - y
//argument 1 - x
//argument 2 - position following
//argument 3 - speed
//argument 4 - max x
//argument 5 - min x
if (argument0 != -1) {
    view_yview[1] = argument0
}
if (argument1 != -1) {
    view_xview[1] = argument1
}
max_x = argument4
min_x = argument5

view_xview[1] += ((argument2-((view_wview[1])/2)) - view_xview[1]) * argument3

//if (view_xview[1] >= (argument4 + view_hview[1])) {
//    view_xview[1] = argument4 + view_hview[1]
//}
