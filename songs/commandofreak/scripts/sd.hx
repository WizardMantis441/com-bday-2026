function theicon() {
    iconP2.setIcon("gabe");
    FlxTween.tween(iconP2, {angle: iconP2.angle + 360}, 1, {ease: FlxEase.quintOut});
}