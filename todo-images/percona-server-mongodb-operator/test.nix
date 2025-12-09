{ pkgs, lib, ... }:

# TODO: Add tests for percona-server-mongodb-operator image
{
  name = "percona-server-mongodb-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for percona-server-mongodb-operator"
    exit 1
  '';
}
