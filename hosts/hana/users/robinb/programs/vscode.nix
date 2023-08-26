{ pkgs }:

{
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
  ];
  userSettings = {
    "editor.fontFamily" = "Comic Mono";
  };
}
