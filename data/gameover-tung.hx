var img:FunkinSprite;

function postCreate() {
    character.visible = false;
    FlxG.camera.zoom = 0.65;

    img = new FunkinSprite(0, 0, Paths.image('TungDead'));
    img.addAnim("idle", "TungDead Idle", 24, true);
    img.playAnim("idle");
    img.scrollFactor.set();
    img.screenCenter();
    img.alpha = 0;
    img.scale.set(3, 3);
    add(img);

    new FlxTimer().start(2.25, () -> {
        FlxTween.tween(img, {alpha: 1}, 4);
    });
}

function update(elapsed:Float) {
    if (controls.ACCEPT) endBullshit();
    if (controls.BACK) exit();
}