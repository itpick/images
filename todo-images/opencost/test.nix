{ pkgs, lib, ... }:

# TODO: Add tests for opencost image
{
  name = "opencost";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opencost"
    exit 1
  '';
}
