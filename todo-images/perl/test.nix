{ pkgs, lib, ... }:

# TODO: Add tests for perl image
{
  name = "perl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for perl"
    exit 1
  '';
}
