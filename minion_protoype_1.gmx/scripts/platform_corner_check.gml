{
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                HANDLE COLLISIONS WITH CORNERS
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    if(hspeed != 0) {
        if(!place_free(x+hspeed,y+vspeed)){
            hspeed = 0;
        }
    }
}