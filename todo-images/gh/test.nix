{ pkgs, lib, ... }:

# TODO: Add tests for gh image
{
  name = "gh";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gh"
    exit 1
  '';
}
