var names = [];

var crtbro:CustomShader = new CustomShader('crt');

function addName(obj, name, xoffs, yoffs) {
    var txt:FlxText = new FlxText(0, 0, 0, name, 36);
    txt.alignment = "center";
    txt.font = Paths.font("Teko-Bold.ttf");
    txt.alpha = 0.9;
    add(txt);

    names.push({
        obj: obj,
        txt: txt,
        x: xoffs,
        y: yoffs
    });

    return txt;
}

function postCreate() {
    FlxG.camera.addShader(crtbro);
   camHUD.addShader(crtbro);
    for (i in [iconP1, iconP2, healthBar, healthBarBG, scoreTxt, missesTxt, accuracyTxt])
        i.visible = false;

    var gunnsTxt = addName(stage.getSprite("gunns"), "YNGGUNS", -50, 150);
    gunnsTxt.alpha = 0.4;
    gunnsTxt.size -= 10;

    addName(strumLines.members[0].characters[0], "COMMANDODEV", -120, 60);

    var aethos = addName(strumLines.members[1].characters[0], "AETHAR", -55, 90);
    aethos.alpha = 0.7;
    aethos.size -= 8;
    
    addName(strumLines.members[2].characters[0], "THATONEGREENGUY", -150, 20);
}

function postUpdate(elapsed:Float) {
    for (n in names) {
        n.txt.x = (n.obj.x + n.obj.width / 2) + n.x;
        n.txt.y = n.obj.y + n.y;
    }
}

function bruh() {
    camGame.alpha = 0;
}