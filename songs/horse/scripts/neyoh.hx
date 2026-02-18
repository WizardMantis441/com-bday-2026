import flixel.addons.util.FlxSimplex;

var harousbg:FunkinSprite;
var thisjit:FunkinSprite;
var harous:FunkinSprite;
var white:FunkinSprite;
var epicflames:FlxSprite;
var vignette:FunkinSprite;

function postCreate() {
    epicflames = new FlxSprite().loadGraphic(Paths.image('stages/horse/flamz'), true, 128, 72);
    epicflames.camera = camHUD;
    epicflames.setGraphicSize(FlxG.width * 1.1, FlxG.height * 1.1);
    epicflames.updateHitbox();
    epicflames.screenCenter();
    epicflames.antialiasing = true;
    epicflames.animation.add("bro", CoolUtil.numberArray(106), 24, true);
    epicflames.blend = 0;
    epicflames.alpha = 0.5;
    epicflames.animation.play("bro");
    epicflames.visible = false;
    add(epicflames);

    harousbg = new FunkinSprite(0, 0, Paths.image('stages/horse/comnohorese'));
    harousbg.scrollFactor.set();
    harousbg.zoomFactor = 0;
    harousbg.screenCenter();
    harousbg.scale.set(1.1, 1.1);
    harousbg.visible = false;
    add(harousbg);

    thisjit = new FunkinSprite(0, 0, Paths.image('stages/horse/MixxedHorse'));
    thisjit.addAnim("ohnahimcrine", "MixxedHorse Idle", 24, true);
    thisjit.playAnim("ohnahimcrine");
    thisjit.scrollFactor.set();
    thisjit.zoomFactor = 0;
    thisjit.screenCenter();
    thisjit.x -= 300;
    thisjit.scale.set(0.75, 0.75);
    thisjit.visible = false;
    thisjit.flipX = true;
    add(thisjit);
    
    harous = new FunkinSprite(0, 0, Paths.image('stages/horse/horseeee'));
    harous.scrollFactor.set();
    harous.zoomFactor = 0;
    harous.screenCenter();
    harous.scale.set(1.1, 1.1);
    harous.visible = false;
    add(harous);

    vignette = new FunkinSprite(0, 0, Paths.image('stages/horse/vignette'));
    vignette.scrollFactor.set();
    vignette.zoomFactor = 0;
    vignette.screenCenter();
    vignette.visible = false;
    // vignette.camera = camHUD;
    add(vignette);
    
    white = new FunkinSprite(0, 0).makeSolid(FlxG.width, FlxG.height);
    white.scrollFactor.set();
    white.zoomFactor = 0;
    white.screenCenter();
    white.alpha = 0.0;
    add(white);
}

function flames() {
    epicflames.visible = true;
    vignette.visible = true;
}

function cinema() {
    FlxTween.tween(epicflames, {alpha: 0}, 0.67);
    FlxTween.tween(white, {alpha: 1}, 0.67, {onComplete: () -> {
        epicflames.visible = false;
        vignette.visible = false;
        harousbg.visible = true;
        thisjit.visible = true;
        harous.visible = true;
        harousbg.y += 80;
        harous.y += 80;
        FlxTween.tween(white, {alpha: 0}, 2, {onComplete: () -> {}});
        FlxTween.num(harousbg.y, harousbg.y - 160, 15, {}, (val:Float) -> {
            harousbg.y = val;
            thisjit.y = val + 275;
            harous.y = val;
        });
    }});
}

function leave() {
    FlxTween.tween(harous, {x: -600}, 6);
}