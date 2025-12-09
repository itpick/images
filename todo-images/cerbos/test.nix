{ pkgs, lib, ... }:

# TODO: Add tests for cerbos image
{
  name = "cerbos";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cerbos"
    exit 1
  '';
}
