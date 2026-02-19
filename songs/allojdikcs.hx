// plan is luis and game over in this here

var seenluis = false;
var luis:FunkinSprite;

function postCreate() {
    GameOverSubstate.script = "data/gameover" + (SONG.meta.name == "tung" ? "-tung" : "");

    luis = new FunkinSprite(0, 0, Paths.image('runmylittleluis'));
    luis.addAnim("run", "luisRUNNN instance 1", 24, true);
    luis.playAnim("run");
    luis.zoomFactor = 0;
    luis.scrollFactor.set();
    luis.scale.set(0.5, 0.5);
    luis.updateHitbox();
    luis.screenCenter();
    luis.x -= 1000;
    luis.camera = camHUD;
    add(luis);

    var chars = [];
    for (sl in strumLines.members) {
        for (c in sl.characters) {
           chars.push(c);
        }
    }

    var total = [0, 0];
    for (c in chars) {
        var pos = c.getCameraPosition();
        total[0] += pos.x;
        total[1] += pos.y;
    }

    total[0] /= chars.length;
    total[1] /= chars.length;

    FlxG.camera.scroll.x = total[0] - FlxG.width / 2;
    FlxG.camera.scroll.y = total[1] - FlxG.height / 2;
}

function beatHit() {
    if (FlxG.random.bool(0.1) && !seenluis) wowluis();
}

function wowluis() {
    remove(luis);
    add(luis);
    seenluis = true;

    FlxTween.cancelTweensOf(luis);
    luis.x = -luis.width;
    FlxTween.tween(luis, {x: FlxG.width}, 0.3);
    FlxG.sound.play(Paths.sound("hehe"));
}