{ pkgs, lib, ... }:

# TODO: Add tests for sqlpad image
{
  name = "sqlpad";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sqlpad"
    exit 1
  '';
}
