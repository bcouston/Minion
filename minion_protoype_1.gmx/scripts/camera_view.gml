//argument 0 - y
//argument 1 - x
//argument 2 - position following x
//argument 3 - speed x
//argument 4 - max x
//argument 5 - min x
//argument 2 - position following y
//argument 3 - speed y
//argument 4 - max y
//argument 5 - min y
if (argument0 != -1) {
    view_yview[1] = argument0
}
if (argument1 != -1) {
    view_xview[1] = argument1
}

if (argument2 != -1) {
    view_xview[1] += ((argument2-((view_wview[1])/2)) - view_xview[1]) * argument3
}
    
max_x = argument4
min_x = argument5

if (argument6 !=  -1) {
    view_yview[1] += ((argument6-((view_hview[1])/2)) - view_yview[1]) * argument7
}

max_y = argument8
min_y = argument9

//if (view_xview[1] >= (argument4 + view_hview[1])) {
//    view_xview[1] = argument4 + view_hview[1]
//}
