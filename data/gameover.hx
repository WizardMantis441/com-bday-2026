var txt:FunkinText;
var img:FunkinSprite;

function postCreate() {
    character.visible = false;
    FlxG.camera.zoom = 0.65;

    txt = new FunkinText(0, 0, 0, "rest In peas.........\n...", 10, false);
    txt.scale.set(10, 10);
    txt.updateHitbox();
    txt.screenCenter();
    txt.scrollFactor.set();
    txt.y -= 300;
    txt.angle = -1;
    add(txt);

    img = new FunkinSprite(0, 0, Paths.image('ohnahimdeadimcrine'));
    img.scrollFactor.set();
    img.screenCenter();
    img.alpha = 0;
    add(img);

    new FlxTimer().start(2.25, () -> {
        FlxTween.tween(img, {alpha: 1}, 4);
    });
}

function update(elapsed:Float) {
    if (controls.ACCEPT) endBullshit();
    if (controls.BACK) exit();
}