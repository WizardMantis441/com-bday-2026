function create() {
    chicken.visible = false;
    lava.visible = false;
    victor.visible = false;
}

public function bgEvent(type:String) {
    switch (type) {
        case "chicken":
            chicken.x = 600;
            chicken.visible = true;
            chicken.animation.onFrameChange.add(() -> {
                chicken.x += 30;
            });
        case "lava":
            lava.x = 500;
            lava.visible = true;
            lava.animation.onFrameChange.add(() -> {
                lava.x += 20;
            });
        case "victor-pre":
            FlxG.sound.play(Paths.sound("victorwtf"));
        case "victor":
            victor.x = 500;
            victor.visible = true;
            victor.animation.onFrameChange.add(() -> {
                victor.x += 25;
            });
    }
}

function weirdsound() {
    FlxG.camera.shake(0.005, 0.2);
    camGame.alpha = 0;
}

function postCreate() {
    // bgEvent("chicken");
    // bgEvent("victor");
}

function onStrumCreation(event:StrumCreationEvent) {
    event.cancelAnimation();
    var s = event.strum;
    s.y -= 10;
    s.alpha = 0;
    FlxTween.tween(s, {y: s.y + 10, alpha: event.player == 1 ? 0.5 : 1}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * event.strumID)});
}

function onPostNoteCreation(event:NoteCreationEvent) {
    event.note.alpha = (event.strumLineID == 1 ? 0.5 : 1) * (event.note.isSustainNote ? 0.5 : 1);
}