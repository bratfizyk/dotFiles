{ pkgs, ... }:

let
  dbUser = "fortpolio";
  dbName = "fortpolio";
in
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_17;

    settings = {
      listen_addresses = "localhost";
      shared_buffers = "256MB";
    };

    ensureDatabases = [
      dbName
    ];

    ensureUsers = [
      {
        name = dbUser;
        ensureDBOwnership = true;
      }
    ];

    initdbArgs = [ "--data-checksums" ];

    authentication = ''
      #type database  DBuser    auth-method
      local ${dbName} ${dbUser} md5
      local all       postgres  trust
    '';
  };

  systemd.services.db-credentials = {
    description = "Delivers dynamic credentials for HWDP Server.";
    enable = true;
    wants = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
    wantedBy = [ "default.target" ];
    path = [ pkgs.postgresql_17 pkgs.su ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      Group = "root";
      ExecStart = pkgs.writeScript "start" ''
        #!${pkgs.bash}/bin/bash
        set -eEuo pipefail
        install -o root -g root -m 400 /dev/null /run/db-credentials-env
        echo "HWDP_DB_PASS=$RANDOM.$RANDOM.$RANDOM.$RANDOM.$RANDOM.$RANDOM" > /run/db-credentials-env
        source /run/db-credentials-env
        su - postgres -c psql <<EOF
        ALTER USER "${dbUser}" WITH PASSWORD '$HWDP_DB_PASS';
        EOF
      '';
    };
  };
}
