{ pkgs, lib, ... }:

# TODO: Add tests for chromium image
{
  name = "chromium";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chromium"
    exit 1
  '';
}
