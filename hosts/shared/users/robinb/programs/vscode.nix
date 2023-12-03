{ pkgs }:

{
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    eamodio.gitlens
    ms-python.python
    vscode-icons-team.vscode-icons
  ]
  ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "discord-vscode";
      publisher = "icrawl";
      version = "5.8.0";
      sha256 = "sha256-IU/looiu6tluAp8u6MeSNCd7B8SSMZ6CEZ64mMsTNmU=";
    }
  ];
  userSettings = {
    "editor.fontFamily" = "Comic Mono";
    "window.titleBarStyle" = "custom";
    "workbench.iconTheme" = "vscode-icons";
  };
}
