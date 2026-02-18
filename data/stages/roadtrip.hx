function create() {
    back.screenCenter();
    frontseats.screenCenter();
    border.screenCenter();
}

function postCreate() {
    for (i in [iconP1, iconP2, healthBar, healthBarBG, scoreTxt, accuracyTxt, missesTxt])
        i.visible = false;
}

function postUpdate(elapsed:Float) {
    camFollow.setPosition(FlxG.width / 2, FlxG.height / 2 + 100);
}

function onStrumCreation(event:StrumCreationEvent) {
    event.sprite = "game/notes/3ds";
}

function onPostStrumCreation(event:StrumCreationEvent) {
    event.strum.scale.set(2, 2);
    event.strum.updateHitbox();
    event.strum.antialiasing = false;   
}

function onNoteCreation(event:NoteCreationEvent) {
    event.noteSprite = "game/notes/3ds";
    // event.note.scale.set(16, 2);
    event.noteScale = 2;
}