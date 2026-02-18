var ismickertgoofy = false;
function hesgoofynow() {
    ismickertgoofy = true;
}

var isheweird = false;
function hesweirdnow() {
    isheweird = true;
}

function onNoteHit(event) {
    if (event.noteType == "gf")
        event.character = boyfriend;

    // trace(event.character);
    if (event.character == dad && isheweird) {
        event.preventAnim();
        dad.playAnim("alt", true, "LOCK");
    }
    
    if (event.character == boyfriend && ismickertgoofy) {
        event.preventAnim();
        boyfriend.playAnim("aha", true, "LOCK");
    }
}