{ pkgs, lib, ... }:

# TODO: Add tests for celeborn image
{
  name = "celeborn";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for celeborn"
    exit 1
  '';
}
