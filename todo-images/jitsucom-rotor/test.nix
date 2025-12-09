{ pkgs, lib, ... }:

# TODO: Add tests for jitsucom-rotor image
{
  name = "jitsucom-rotor";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jitsucom-rotor"
    exit 1
  '';
}
