{ pkgs, lib, ... }:

# TODO: Add tests for selenium-standalone-chromium image
{
  name = "selenium-standalone-chromium";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-standalone-chromium"
    exit 1
  '';
}
