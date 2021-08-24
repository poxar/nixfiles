{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;
  users.users.pmi = {
    isNormalUser = true;
    home = "/home/pmi";
    description = "Philipp Millar";
    group = "users";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSerg94O59v1E97NIfH4SEE8Zid07ObJ8yuIHflkXrB pmi@leonis"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHP8YB+3qMZz/xuswNjhz+WdfodxQv7Whmja3TPxu3Ty pmi@tauron"
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJcqitHIGWlybiWO6YUcjrH22BRn68G3UdNka1B03JiTcLVkfwnr7osDQFwg6C8jiL5p3iT0MYhMRuK3nLRAJYM= pmi@gemenon"
    ];
  };
}
