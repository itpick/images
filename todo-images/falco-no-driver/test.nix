{ pkgs, lib, ... }:

# TODO: Add tests for falco-no-driver image
{
  name = "falco-no-driver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falco-no-driver"
    exit 1
  '';
}
