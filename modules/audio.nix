{ ... }: {
  security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa = {
  #     enable = true;
  #     support32Bit = true;
  #   };
  #   pulse.enable = true;
  # };
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    extraConfig = "load-module module-combine-sink";
  };
  nixpkgs.config.pulseaudio = true;
  services.mpd = {
    enable = true;
    extraConfig = ''
          audio_output {
            type "pulse"
      			name "Pulseaudio"
          }
    '';
  };
}
