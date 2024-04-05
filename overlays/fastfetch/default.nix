{ config, ... }:

(self: super: {
  fastfetch = super.fastfetch.override {
    libpulseaudio = null;
    opencl-headers = null;
    rpm = null; # remove rpm support from fastfetch since we use nix (duh!), which fails to build anyways
    vulkan-loader = null;
    wayland = null;
  };
})
