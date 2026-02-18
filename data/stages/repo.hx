function create() {
    chicken.visible = false;
    lava.visible = false;
    victor.visible = false;
}

public function bgEvent(type:String) {
    switch (type) {
        case "chicken":
            chicken.x = -500;
            chicken.visible = true;
            chicken.animation.onFrameChange.add(() -> {
                chicken.x += 30;
            });
        case "lava":
            lava.x = -500;
            lava.visible = true;
            lava.animation.onFrameChange.add(() -> {
                lava.x += 50;
            });
        case "victor":
            victor.x = -500;
            victor.visible = true;
            victor.animation.onFrameChange.add(() -> {
                victor.x += 40;
            });
    }
}

function postCreate() {
    // bgEvent("chicken");
    // bgEvent("victor");
}