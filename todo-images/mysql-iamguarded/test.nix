{ pkgs, lib, ... }:

# TODO: Add tests for mysql-iamguarded image
{
  name = "mysql-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mysql-iamguarded"
    exit 1
  '';
}
