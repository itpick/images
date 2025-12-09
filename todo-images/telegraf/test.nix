{ pkgs, lib, ... }:

# TODO: Add tests for telegraf image
{
  name = "telegraf";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for telegraf"
    exit 1
  '';
}
