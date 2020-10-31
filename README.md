# Godot Accessible Starter

This starter project sets up [Godot](https://godotengine.org) with the [accessibility](https://github.com/lightsoutgames/godot-accessibility) and [TTS](https://github.com/lightsoutgames/godot-tts) plugins so the editor is accessible.

## Supported platforms

 * Linux via Speech Dispatcher
 * Windows via Tolk, including SAPI support for anyone not using a screen reader (not yet tested but code is written)
 * Android

## Usage

```bash
$ git clone --recursive https://github.com/lightsoutgames/godot-accessible-starter yourgame
$ cd yourgame
$ git remote rm origin
$ # Any release from https://github.com/lightsoutgames/godot-tts/releases/ should do.
$ wget https://github.com/lightsoutgames/godot-tts/releases/download/v0.3.1/godot-tts.zip -O addons/godot-tts.zip
$ unzip -d addons addons/godot-tts.zip
```

Windows-only: If you need speech in the editor and would prefer to use your screen reader, please perform the following additional steps:

 * Place godot.exe in the working directory of your game.
 * Copy all DLLs from addons\godot-tts\target\release to the game's working directory.
 * Use the godot.exe executable in your game directory to edit and run the game.

Without these changes, you'll only get SAPI speech in the editor. Exporting games correctly places dependent DLLs alongside the game executable, so these steps aren't needed if you only want accessibility during the game itself.

Finally run:

```bash
$ godot -e
```

from within this repository and start building your game!

## What's in the box?

 * The accessibility plugin is automatically loaded, eliminating the need to use the inaccessible editor to enable it.
 * TTS is loaded in a global script which is available in every node. Run `TTS.speak("Text to speak", interrupt)` from anywhere in your code to speak something. See _scenes/Main.gd_ as an example.
 * `ScreenReader` is also loaded as a global node, making in-game user interfaces automatically accessible.
 * A Main scene with a script is created, and set as the launch scene.

## Accessibility tips

 * Navigate to Editor -> Editor Settings -> External Editor, check the box, and enter a path to an accessible text editor. The embedded Godot script editor is not currently accessible, and may not be for a long time or at all. VSCode is a good option.

## Testing

To ensure that speech works, once the editor has launched, pressing F5 should speak "Hello, world." Note that at this point the game is running and there's no way to quit. To get accessible functionality back, you'll need to alt-tab back to the editor window and press _F1_, _F2_ or _F3_ until your screen is changed. Launching a game from the editor removes focus from all nodes, and keyboard focus doesn't return until another is focused. These screen-switching commands set a focus and, in turn, get you up and running again.

## Updating

The accessibility plugin is a work in progress. As such, periodically you'll want to run this from within your game:

```bash
$ cd addons/godot-accessibility
$ git pull
$ cd ..
$ git commit godot-accessibility -m "Update accessibility plugin."
```

or something similar. Likewise, you'll also likely want to upgrade the godot-tts plugin from time to time, and check this starter for current suggested best practices.
