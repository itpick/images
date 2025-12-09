{ pkgs, lib, ... }:

# TODO: Add tests for regclient-regctl image
{
  name = "regclient-regctl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for regclient-regctl"
    exit 1
  '';
}
