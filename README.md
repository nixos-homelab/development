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

- **forgejo**: Forgejo with its database in the `postgresql` module of
  `homelab-storage`, local accounts only and registration closed. The web UI
  and SSH share the address of its Gateway: HTTPS on 443, git over SSH on
  port 22 to Forgejo's built-in SSH server. An admin user is created at
  start, with a password `setup-secrets` generates into the Secret
  `forgejo-secrets` (`ADMIN_PASSWORD`).
