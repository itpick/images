{ pkgs, lib, ... }:

# TODO: Add tests for kepler image
{
  name = "kepler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kepler"
    exit 1
  '';
}
