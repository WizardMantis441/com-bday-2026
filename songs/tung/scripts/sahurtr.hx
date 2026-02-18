var explosion:FunkinSprite;

function postCreate() {
    explosion = new FunkinSprite(1000, 800, Paths.image('stages/tung/explosion'));
    explosion.addAnim("idle", "Explosion Idle");
    explosion.playAnim("idle", true);
    explosion.visible = false;
    explosion.setGraphicSize(FlxG.width, FlxG.height);
    explosion.screenCenter();
    explosion.zoomFactor = 0;
    explosion.scrollFactor.set();
    explosion.forceIsOnScreen = true;
    add(explosion);
}

function tung() {
    explosion.playAnim("idle", true);
    explosion.visible = true;
}

function update() {
    if (explosion.isAnimFinished())
        explosion.visible = false;
}