{ pkgs, lib, ... }:

# TODO: Add tests for pgwatch image
{
  name = "pgwatch";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgwatch"
    exit 1
  '';
}
