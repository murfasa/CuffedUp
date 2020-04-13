# CuffedUp - A proper cuff script...
------------
![handsup screenshot](https://i.imgur.com/L1iUxzR.png)
------------
Due to the lack of a fully functioning cuff script in FiveM without the need of ESX, @TreWilly and I created this...

https://medal.tv/clips/22275941/PkXNu3id1jBG


## Features
* Handcuff animations
* Cuff loop does not break
* Unique melee based handcuff targeting system
* Hands-up on hotkey
* Cuff Sounds

![handsup screenshot](https://i.imgur.com/3hSlF82.png)

## Usage
Hold ``X`` to put hands up.
In order to handcuff someone, go up to them and hold left click to target them. Then, press ``E``.

## Dependencies
* [InteractSound](https://forum.cfx.re/t/release-play-custom-sounds-for-interactions/8282)

## Installation
Install CuffedUp as you would any script.

Note: You must have the InteractSound resource in order for cuff noises to work! Move the cuff.ogg and uncuff.ogg files to /client/html/sounds in your InteractSound resource. Add this under 'files' in your InteractSound __resource.lua:
```
files {
    'client/html/index.html',
    'client/html/sounds/cuff.ogg',  # ADD THIS
    'client/html/sounds/uncuff.ogg'  # ADD THIS
}
```

## Changelog
*v1*
* Release

## Credits
Credit to @TreWilly for logo, testing, and sourcing audio along with animations.