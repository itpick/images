{ pkgs, lib, ... }:

# TODO: Add tests for tetragon image
{
  name = "tetragon";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tetragon"
    exit 1
  '';
}
