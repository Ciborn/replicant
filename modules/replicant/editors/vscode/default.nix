{ config, pkgs, lib, username, ... }:

with lib; let
  cfg = config.replicant.editors.vscode;
in {
  options.replicant.editors.vscode = {
	enable = mkEnableOption "Enable Visual Studio Code";
  };

  config = mkIf cfg.enable {
		home-manager.users.${username}.programs.vscode = {
			enable = true;

			extensions = with pkgs.vscode-extensions; [
				arrterian.nix-env-selector
				bbenoist.nix
				eamodio.gitlens
				github.copilot
				mechatroner.rainbow-csv
				ms-azuretools.vscode-docker
				vscode-icons-team.vscode-icons
			] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
				{
					name = "discord-vscode";
					publisher = "icrawl";
					version = "5.8.0";
					sha256 = "sha256-IU/looiu6tluAp8u6MeSNCd7B8SSMZ6CEZ64mMsTNmU=";
				}
				{
					name = "qml";
					publisher = "bbenoist";
					version = "1.0.0";
					sha256 = "1ncabpljax9kr49paxy2whjwq683cjvar0z5pf00wb7ra1b6g65n";
				}
			];

			userSettings = {
				"editor.cursorSmoothCaretAnimation" = "on";
				"editor.fontFamily" = "Comic Mono";
				"github.copilot.enable" = {
					"quarto" = false;
					"*" = true;
				};
				"window.titleBarStyle" = "custom";
				"workbench.iconTheme" = "vscode-icons";
			};
		};
  };
}
