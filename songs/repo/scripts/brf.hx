var crtbro:CustomShader = new CustomShader('crt');

function postCreate() {
    FlxG.camera.addShader(crtbro);
   camHUD.addShader(crtbro);
    for (i in [iconP1, iconP2, healthBar, healthBarBG, scoreTxt, missesTxt, accuracyTxt])
        i.visible = false;
}

function bruh() {
    camGame.alpha = 0;
}