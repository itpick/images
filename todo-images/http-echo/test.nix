{ pkgs, lib, ... }:

# TODO: Add tests for http-echo image
{
  name = "http-echo";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for http-echo"
    exit 1
  '';
}
