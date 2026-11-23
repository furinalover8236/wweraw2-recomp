# WWE Raw 2 static recompilation

A port of the original Xbox game *WWE Raw 2* to native code with the
[xboxrecomp](https://github.com/apexJCL/xboxrecomp) toolkit, driven by
[xboxrecomp-cli](https://github.com/apexJCL/xboxrecomp-cli). Started with
`xbr new`.

**No game data here, and none ever will be.** Put your own dump of the disc
(`default.xbe` and the game's files) in `game_files/`; git ignores it.

```sh
./wweraw2 setup      # once: .venv, llvm-mingw, the toolkit (each download sha256-pinned)
./wweraw2 all        # analyze (parse, disasm, funcid, abi), recomp, build
./wweraw2 doctor     # what this machine has, and what is next
```

Windows: `wweraw2` (the `wweraw2.cmd` wrapper) or `py -3 wweraw2.py`, from a
short checkout path such as `C:\g\wweraw2`, with
`git config --global core.longpaths true`.

The first build is `build-win/wweraw2_recomp.exe`, cross-compiled with llvm-mingw on
any host, or `build/wweraw2_recomp` with Apple clang on a Mac (Metal). It will
crash the first time: that is where the port starts.
`src/recomp_manual.c` takes hand-written overrides, `config/seed_functions.json`
the function starts the disassembler missed, and `./wweraw2 analyze` then
`./wweraw2 recomp` regenerate `src/recomp/gen/` (never edit it by hand).
The CLI's `docs/porting.md` has the loop; `game.toml` has every setting,
documented in the CLI's `docs/manifest.md`.

## Mods and enhancements

F10 on the keyboard opens a menu over the game. Every mod is off, or at the
Xbox's setting, unless the table says otherwise.

| Mod | Menu page | What it does | Default |
|---|---|---|---|
| **Profile** | Shaders | A post-processing shader over the picture: a CRT look, or FSR upscaling. | Off |
