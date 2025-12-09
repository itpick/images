{ pkgs, lib, ... }:

# TODO: Add tests for whereabouts image
{
  name = "whereabouts";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for whereabouts"
    exit 1
  '';
}
