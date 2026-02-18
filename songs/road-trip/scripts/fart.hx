var bg:FunkinSprite;
var ending:FunkinSprite;

function postCreate() {
    bg = new FunkinSprite(0, 0).makeSolid(FlxG.width, FlxG.height, 0xA0000000);
    bg.scrollFactor.set();
    bg.zoomFactor = 0;
    bg.alpha = 0;
    add(bg);
    
    ending = new FunkinSprite(0, 0, Paths.image('stages/roadtrip/End3DS'));
    ending.addAnim("1", "End3DS P10", 12, true);
    ending.addAnim("2", "End3DS P20", 12, true);
    ending.addAnim("3", "End3DS P30", 12, true);
    ending.addAnim("4", "End3DS P40", 12, true);
    ending.playAnim("1");
    ending.scrollFactor.set();
    ending.zoomFactor = 0;
    ending.screenCenter();
    ending.scale.set(2, 2);
    ending.visible = false;
    add(ending);


    for (i in [iconP1, iconP2, healthBar, healthBarBG, scoreTxt, missesTxt, accuracyTxt])
        i.visible = false;
}

function onNoteHit(event:NoteHitEvent) {
    event.character = switch (event.noteType) {
        case "trent": strumLines.members[0].characters[0];
        case "mayro": strumLines.members[0].characters[1];
        case "gary": strumLines.members[0].characters[2];
        case "victor": strumLines.members[0].characters[3];
        default: boyfriend;
    }
}

function fade() {
    for (strum in strumLines.members[1].members) {
        FlxTween.tween(strum, {alpha: 0}, 1);
        FlxTween.tween(bg, {alpha: 1}, 1);
    }
}

function cutscene(which) {
    ending.visible = true;
    ending.playAnim(which);
}