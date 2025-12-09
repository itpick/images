{ pkgs, lib, ... }:

# TODO: Add tests for jitsucom-console image
{
  name = "jitsucom-console";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jitsucom-console"
    exit 1
  '';
}
