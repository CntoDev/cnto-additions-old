The cnto-mod super-repository
=============================

This repo should contain all official custom CNTO addons as unpacked directories
(to be packed+signed into PBOs). Trivial addons can be stored here directly,
more complex ones should be referenced via gitlinks, eg. git submodules and
this repo should be then cloned as `git clone --recursive`.

FTR, an important distinction with the Arma series:

- an "addon" is essentially a single PBO (or unpacked PBO contents)
- a "mod" is a collection of "addons", giving them a single name/description
  and name (usually starting with `@`) to be specified as `-mod=` for the
  `arma3` executable

Few rules (to keep things organized)
------------------------------------

- don't upload PBO-packed mods or binarized configs

  - text data can be much better compressed/deltified by git
  - in text, we can actually see (diff) what changed between two commits
  - two people can work on the same file, without one destroying work
    of the other by overwriting the other's version - git does clean merges
    on text
  - if your addon is already packed/binarized

    - extract PBOs using ie. cpbo / PBO Manager / DePbo / ...
    - de-binarize configs using ie. unRap

- when commiting new changes, prefix commit message header (1st line) with
  the name of the addon being updated (if the commit updates one), ie.

      stamina_tweaks: adjust max carry weight to 1400

Using this super-repository
---------------------------

To actually create a mod out of this repository, you can simply

1. clone it as `git clone --depth 1 --recursive <url> '@cnto'`
2. pack all directories inside `addons` into PBOs
3. ship it
4. to update, instead of `git pull`, use

       git pull
       git submodule update --init
       git pull --recurse-submodules

However it's recommended to exclude git metadata from this repository as well as
all the submodules, to reduce size. You can easily achieve this by having the
repository metadata in one directory and the actual files in another,

1. clone as `git clone --recursive --separate-git-dir cnto-meta <url> '@cnto'`,
   `@cnto` now contains all data except git metadata
2. see steps 2-4 above
