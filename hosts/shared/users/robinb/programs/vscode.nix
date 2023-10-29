{ pkgs }:

{
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
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
    {
      name = "yuck";
      publisher = "eww-yuck";
      version = "0.0.3";
      sha256 = "sha256-DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
    }
  ];
  userSettings = {
    "editor.fontFamily" = "Comic Mono";
    "window.titleBarStyle" = "custom";
    "workbench.iconTheme" = "vscode-icons";
  };
}
