{ pkgs, lib, ... }:

# TODO: Add tests for selenium-distributor image
{
  name = "selenium-distributor";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-distributor"
    exit 1
  '';
}
