<p align="center">
    <img src="https://avatars2.githubusercontent.com/u/50863181">
</p>
<p align="center">
    <a href="https://github.com/ArmaForces/SerialKillers/issues">
        <img src="https://img.shields.io/github/issues-raw/ArmaForces/SerialKillers.svg?label=Issues" alt="ArmaForces SerialKillers Issues">
    </a>
    <a href="https://github.com/ArmaForces/SerialKillers/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GPLv2-red.svg" alt="ArmaForces SerialKillers License">
    </a>
    <a href="https://github.com/ArmaForces/SerialKillers/actions">
        <img src="https://github.com/ArmaForces/SerialKillers/workflows/Arma/badge.svg">
    </a>
</p>
<p align="center"><sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases/latest">CBA</a>.</strong></sup></p>

**ArmaForces SerialKillers** is a asymetric PvP gamemode created for the members of [ArmaForces](https//armaforces.com), polish Arma 3 community.

Idea based on Arma 2 SerialKillers 2009 gamemode by NeoArmageddon and Mondkalb.

The mod and the missions are on the same foundation as the ACE3 mod, using its framework, systems, tools and standards. It is entirely **open-source** and licensed under the GNU General Public License ([GPLv2](https://github.com/ArmaForces/SerialKillers/blob/master/LICENSE)).

Huge appreciation and thanks to [ACE3 Team](http://ace3mod.com/team.html) for their open-source nature and permission to use their systems.

## Overwiew

> Police obtained information that up to 4 well equipped killers want to wreak havoc on Chernarus. Their task is simple - stop the assassins as soon as possible. However no one really cares about predictions of the attack, so the Police has a very limited equipment.

**Play as a killer or a cop in this asymetric yet balanced-out scenario designed for fun first and competition second.**

- As a cop, start as ordinary patrol unit armed with pistols only and obtain new gear the more successful killers are
- As a killer, experience increasing difficulty the more civilians you kill and the closer you are to your goal
- Chase or be chased in epic pursuits through your favourite maps
- Experience every game and every map differently due to civilians and vehicles generation algorithm
- Witness civilians trying to live their lives, travelling and committing roadkill (_albeit that's just Arma AI driving_) while being hunted by the killers
- Customize gameplay settings to your likings
- Create your own custom weapons/vehicles configuration

## Supported Mods

- [ACE](http://steamcommunity.com/sharedfiles/filedetails/?id=463939057) arsenal and interactions supersede vanilla solutions if possible
  - Use [ACE No Medical](https://steamcommunity.com/sharedfiles/filedetails/?id=3053169823) patch for best experience
- CUP & RHS vehicles and equipment presets
- Any equipment/vehicle mod as long as you create custom equipment preset

## Supported Maps

Every map with defined locations will work. You only need to place police stations, jail and units (plus some more minor things). For examples see [Malden mission](https://github.com/ArmaForces/SerialKillers/tree/master/addons/missions/SK_test.Malden).

Included scenarios:

- Chernarus (Standard/Summer/Winter)
- Malden
- Tanoa (in progress)
- Werferlingen (in progress)

## Development Setup

### Requirements

- Arma 3
- Arma 3 Tools (available on Steam)
- Run Arma 3 and Arma 3 Tools directly from Steam once to install registry entries (and again after every update)
- [HEMTT](https://github.com/synixebrett/HEMTT) binary placed in project root or globally installed
  - `hemtt` (Linux) or `hemtt.exe` (Windows) or `setup.exe` (Windows global install)

### Procedure

_Replace `hemtt` with `hemtt.exe` on Windows._

- Open terminal (Linux) or command line (Windows)
- Run `$ hemtt build` to create a development build (add `-f` to overwrite already built addons)
- Run `$ hemtt build --release` to create a release build (add `-f` to overwrite already built release)
- Run `$ hemtt clean` to clean build files

**Windows Helpers:**

- Double-click `build.bat` to create a development build

### Recommended tools

It's recommended to use [Visual Studio Code](https://) editor with following plugins to ensure equal development environment for all contributors:

- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [SQFLint](https://marketplace.visualstudio.com/items?itemName=skacekachna.sqflint)
- [SQF Langauge](https://marketplace.visualstudio.com/items?itemName=Armitxes.sqf)
- [psioniq File Header](https://marketplace.visualstudio.com/items?itemName=psioniq.psi-header)
