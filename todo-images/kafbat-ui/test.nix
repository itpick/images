{ pkgs, lib, ... }:

# TODO: Add tests for kafbat-ui image
{
  name = "kafbat-ui";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafbat-ui"
    exit 1
  '';
}
