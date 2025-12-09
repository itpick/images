{ pkgs, lib, ... }:

# TODO: Add tests for cc-dynamic image
{
  name = "cc-dynamic";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cc-dynamic"
    exit 1
  '';
}
