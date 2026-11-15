{ inputs, self, ... }:
{
  lib,
  config,
  ...
}:
let
  cfg = config.homelab.homepage.integrations.forgejo;
in
{
  options.homelab.homepage.integrations.forgejo = {
    enable = lib.mkOption {
      description = "integration of forgejo with homepage";
      type = lib.types.bool;
      default = config.homelab.forgejo.enable && config.homelab.homepage.enable;
      defaultText = lib.literalExpression "config.homelab.forgejo.enable && config.homelab.homepage.enable";
    };
  };
  imports = [
    inputs.homelab-shared.nixosModules.homepage
    self.nixosModules.homepage
  ];
  config = lib.mkIf cfg.enable {
    homelab.homepage = {
      sections.Development.enable = lib.mkDefault true;
      services.Development.Forgejo = {
        enable = lib.mkDefault true;
        icon = "forgejo.png";
        description = "Git forge";
        href = "https://forgejo.${config.homelab.workloads.domain}";
      };
    };
  };
}
