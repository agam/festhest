{
  network.description = "festhest";

  festhest =
    { config, pkgs, ... }: let
      festhest = import ./default.nix { inherit pkgs; };
    in
    {
      networking.hostName = "festhest";

      networking.firewall.allowedTCPPorts = [ 22 80 ];
      environment.systemPackages = [ festhest ];


      systemd.services.festhest = {
        description = "festhest Webserver";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        serviceConfig =
          {
            ExecStart = "${festhest}/bin/festhest";
          };
      };
    };
} 
