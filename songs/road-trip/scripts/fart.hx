function onNoteHit(event:NoteHitEvent) {
    event.character = switch (event.noteType) {
        case "trent": strumLines.members[0].characters[0];
        case "mayro": strumLines.members[0].characters[1];
        case "gary": strumLines.members[0].characters[2];
        case "victor": strumLines.members[0].characters[3];
        default: boyfriend;
    }
}