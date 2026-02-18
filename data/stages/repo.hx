function create() {
    chicken.visible = false;
    lava.visible = false;
    victor.visible = false;
    bg.alpha = 0.75;
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
            lava.x = 700;
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

function postCreate() {
    // bgEvent("chicken");
    // bgEvent("victor");
}

function onStrumCreation(event:StrumCreationEvent) {
    // if (event.player == 1) {
        event.cancelAnimation();
        
        var s = event.strum;
        s.y -= 10;
        s.alpha = 0;
        FlxTween.tween(s, {y: s.y + 10, alpha: event.player == 1 ? 0.5 : 1}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * event.strumID)});
    // }
}

function onPostNoteCreation(event:NoteCreationEvent) {
    event.note.alpha = (event.strumLineID == 1 ? 0.5 : 1) * (event.note.isSustainNote ? 0.5 : 1);
}


// function onPostStrumCreation(event:StrumCreationEvent) {
//     trace(event.player);
//     if (event.player == 2) {
//         // event.cancelAnimation();
//         // babyArrow.y -= 10;
//         // babyArrow.alpha = 0;
//         // FlxTween.tween(babyArrow, {y: babyArrow.y + 10, alpha: 1}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * i * (4 / (data.keyCount != null ? data.keyCount : 4)))});
//     }
// }