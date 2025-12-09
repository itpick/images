{ pkgs, lib, ... }:

# TODO: Add tests for distribution image
{
  name = "distribution";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for distribution"
    exit 1
  '';
}
