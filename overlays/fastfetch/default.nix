{ ... }:

# remove rpm support from fastfetch since we use nix (duh!), which fails to build anyways
(self: super: {
  fastfetch = super.fastfetch.override { rpm = null; };
})
