{ pkgs, lib, ... }:

# TODO: Add tests for mysql-client image
{
  name = "mysql-client";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mysql-client"
    exit 1
  '';
}
