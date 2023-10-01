# mkdlc-touhou-spellbubble
Generate DLC unlocker NSPs for Touhou Spell Bubble from scratch.

**Important: This repository does not contain any copyrighted material. NSPs are generated from scratch using free open-source tools provided by the Homebrew community.**

## Prerequisites

  * Dump the production decryption keys (`prod.keys`) from your Nintendo Switch using LockpickRCM and put them into `~/.switch/prod.keys`.
  * Install [hacpack](https://github.com/The-4n/hacPack) on your system and make sure that the `hacpack` binary is added to `$PATH` (e.g. by installing hacpack into `/usr/local/bin`)


## Usage

Generate all possible DLC unlock packages from #1 up to #255.
```
./mkdlc.sh
```
There are currently only about 32 DLCs available, so most of these packages won't do anything at all. They may unlock future DLC content that hasn't been yet released though.

