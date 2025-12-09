{ pkgs, lib, ... }:

# TODO: Add tests for netcat image
{
  name = "netcat";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for netcat"
    exit 1
  '';
}
