{ pkgs, lib, ... }:

# TODO: Add tests for percona-server image
{
  name = "percona-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for percona-server"
    exit 1
  '';
}
