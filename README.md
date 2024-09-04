# fancontrol-gui
This is a GUI for [lm-sensor's](https://github.com/lm-sensors/lm-sensors) fancontrol, ported & packaged for NixOS.

Follow the steps below to use in a flake-enabled environment:

## 01. Add flake input
Inside your flake.nix file, add the following to your inputs:

```nix
inputs.framework-laptop.url = "github:JaysFreaky/fancontrol-gui";
```

## 02. Add package variable
Inside whichever file declares your packages, add this to the top in the 'let' declarations:

```nix
let
  fancontrol-gui = inputs.fancontrol-gui.packages.${pkgs.system}.default;
in {
```

## 03. Declare environment.systemPackages
To use this package, declare it like so:

```nix
environment.systemPackages = with pkgs; [
  fancontrol-gui
];
```

---
# Credits
[Maldela](https://github.com/Maldela) created [fancontrol-gui](https://github.com/Maldela/fancontrol-gui), which can greatly assist in setting up fan curves via pwmconfig/fancontrol. I've used it before on a Fedora system to create a base curve, and wanted to package it for NixOS.
