{ pkgs, lib, ... }:

# TODO: Add tests for jitsucom-bulker image
{
  name = "jitsucom-bulker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jitsucom-bulker"
    exit 1
  '';
}
