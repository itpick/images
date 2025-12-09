{ pkgs, lib, ... }:

# TODO: Add tests for gitness image
{
  name = "gitness";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitness"
    exit 1
  '';
}
