The cnto-additions repository
=============================

This repo contains small CNTO-specific tweaks, bits and bobs as addons, so that
there doesn't have to be a @mod for each single one.

For anything bigger/nontrivial, please use a separate repository.

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

    ```
    stamina_tweaks: adjust max carry weight to 1400
    ```
