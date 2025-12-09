{ pkgs, lib, ... }:

# TODO: Add tests for skaffold image
{
  name = "skaffold";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for skaffold"
    exit 1
  '';
}
