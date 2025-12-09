{ pkgs, lib, ... }:

# TODO: Add tests for jetty image
{
  name = "jetty";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jetty"
    exit 1
  '';
}
