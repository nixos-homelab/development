# nixos-homelab-development

Software development on top of [nixos-homelab](https://github.com/nixos-homelab/shared):
a private Forgejo with its Actions runner in the cluster, and Renovate
keeping the dependencies of its repositories up to date.

For the full list of module options, see [the options reference](https://nixos-homelab.github.io/development/options/).

## Setup

```nix
{
  inputs = {
    ...
    homelab-development = {
      url = "github:nixos-homelab/development";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ...
  };
}
```

## Modules

None yet.
