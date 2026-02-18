import flixel.addons.util.FlxSimplex;

function postCreate() {
    stage.getSprite("cover").visible = false;
}

function fakecountdown(which) {
    countdown(Std.int(which));
}

function bluescreen() {
    stage.getSprite("cover").visible = true;
    stage.getSprite("victor").animation.pause();
}

function shoot() {
    FlxG.camera.shake(0.1, 1);
    camHUD.shake(0.1, 1);
}

function endbluescreen() {
    stage.getSprite("cover").visible = false;
    stage.getSprite("victor").animation.resume();
}

var isbfdancing = false;
function bfdancetime() {
    isbfdancing = true;
}

function bfstopdancing() {
    isbfdancing = false;
    dad.angle = 0;
}

var isbflosinghisshit = false;
function backflip() {
    FlxTween.tween(dad, {y: dad.y - 500, angle: dad.angle - 360}, 0.5, {ease: FlxEase.sineIn, onComplete: () -> {
        FlxTween.tween(dad, {y: dad.y + 700, angle: dad.angle - 8742}, 0.67, {ease: FlxEase.quintOut, onComplete: () -> {
            dad.color = 0xFFFF0000;
            isbflosinghisshit = true;
        }});
    }});
}

function onPostCountdown(event) {
    if (Conductor.songPosition > 1000)
        event.sound.volume = 0;
}

function update() {
    if (isbfdancing)
        dad.angle += FlxSimplex.simplex(0, Conductor.songPosition / 1000) * 50;

    if (isbflosinghisshit) {
        dad.x = FlxG.width / 2 + FlxSimplex.simplex(0, Conductor.songPosition / 805) * 1000 - 500;
        dad.y = FlxG.width / 2 + FlxSimplex.simplex(Conductor.songPosition / 805, 0) * 1000 - 500;
    }
}