{ pkgs, lib, ... }:

# TODO: Add tests for falcosidekick image
{
  name = "falcosidekick";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falcosidekick"
    exit 1
  '';
}
