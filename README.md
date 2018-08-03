The arma-additions repository
=============================

Here be various small tweaks, additions or fixes of various mods that are
commonly used in "MilSim" or "Serious" Arma 3 gameplay communities.

These are maintained mainly by me (Freghar) and as such are pretty specific
to me, but feel free to browse and cherry-pick what you like or just get
inspired by some algorithms.

I realize that the `CfgPatches` names don't have any author-based prefix,
like many Arma modders like to use, but I don't fancy that approach and have
deliberately chosen fairly long classnames to hopefully avoid any conflicts.
Not a great solution, you're right.

To build the PBOs, simply pack the directories in `addons`, using `cpbo` or
`armake` with `--packonly` or using any other tool that can just pack files
into PBO without processing any `.cpp` or `.h(pp)` files.
