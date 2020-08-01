Metal Gear 1 Dynamic Vsync patch v2
-----------------------------------
(c) 2011 by FRS

1) This patch implements the Dynamic Vsync timing routines, allowing the game
to be run on with the turbo enabled on machines that support this. The turbo
will be enabled by default on any machine that has the standard CHGCPU routine
on its BIOS (like MSX Turbo-R machines).

2) The patch will also implement the following enhancements:

- TAB	: throttle game speed
- SPACE	: speed up text dialogs, now works like Metal Gear-2
- Automatically sets the VDP to 60Hz on boot, to play the game at the correct
  speed even on european machines. If you have an old european TV that doesn't
  support this, keep SELECT pressed on boot to disable it.
- Removed the annoying region lock. Now it's possible to play the japanese
  version on non-japanese machines
- Enhanced sprite cycling: if you have a turbo machine, the sprite cycling
  routine will take advantage of that and the flickering of the sprites will
  occur at a higher framerate.
- Improved graphics for the moving parts of the bridge. They now match the
  non-moving pieces better.

Note: The game only features load/savegames to cassete, but you can use the
GameMaster 2 with it. GameMaster2 will allow you to load/savegames on disk on
a real MSX.

How to apply the patch
-----------------------

First, make sure you have the original japanese ROM, which has the following
checksum:
SHA1(MG1J.ROM)= a52021f1b257c7c35d626d5d642134091c45e4f4

You can use the following tools to verify the SHA1 checksum:
- Windows:
  -MD5 & SHA-1 Checksum Utility 1.1
  - HashTab
- Mac OS-X:
  - DropHash
  - HashTab
  - (or use the Linux solution below)
- Linux:
  - Just type "openssl dgst -sha1 MYGAME.ROM" on a shell (without the quotes,
    off course).

Note: If you want to play the game in English, 1st apply the Metal Gear
Retranslation patch v1.9 before applying this patch. You can get it here:
http://www.romhacking.net/trans/842/

Secondly, there are two versions of this patch: The IPS version and the XPC
version.

- For the IPS version, select an IPS patcher like IPSWin, LunarIPS or UIPS and
  use it following to the tool's instructions.

- For the XPC version, on-the-fly patching: just place the XPC patch under the
  same directory of your ROM and make sure both have the same name
  (i.e: MYGAME.ROM and MYGAME.XPC). The bugfix will be applied automatically
  by ExecROM and you will be asked if you want to apply any optional patches
  included (usually cheating/trainer patches).

- To apply the XPC version definitely, get xpctools
  (at http://www.sf.net/projects/execrom ) and type the command line below:

xpcapply MYGAME.ROM MYGAME.XPC -o MYGAMET.ROM -ask 


==============================

FAQ
---

Q: Will the patched game run on non-turbo machines?
A: Yes, the patch implements a new timing routine that supports any CPU speed,
   including of course the standard 3.57MHz Z80A.

Q: I applied the patch and the resulting ROM doesn't work! What is wrong?
A: You're probably trying to apply the patch on a ROM with the incorrect
   checksum.

Q: I applied the XPC patch and some undesired features (like invulnerability)
   are being enabled by default! How can I select which patches will be applied?
A: You forgot to add the "-ask" parameter to the xpcapply command-line.

Q: Why there are IPS and XPC patches? Do I need to apply both?
A: Its the same patch in two different formats. You only need to use the format
   you think is more suitable to your needs. IPS files only support one single
   patch per file and need to be pre-applied, while XPC files support multiple
   different patches in a single file and can be used for on-the-fly patching.

==============================

I hope you enjoy these fixes.

