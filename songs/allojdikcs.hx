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
}

function beatHit() {
    if (FlxG.random.bool(0.2) && !seenluis) wowluis();
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