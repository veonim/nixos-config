{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.ahmed = {
    isNormalUser = true;
    home = "/home/ahmed";
    extraGroups = [ "docker" "lxd" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$2y$10$FZSsmo1Qx4yQHADHRVAgquHTrruKa5m2AIzJrWx48F7RUxTFWvZmG";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBUcUcFjGm+JKMdP1F5bQeiVv0TAfweHygMhur0Y122V ahmed@tars-mbp"
    ];
  };
}
