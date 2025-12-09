{ pkgs, lib, ... }:

# TODO: Add tests for onepassword-operator image
{
  name = "onepassword-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for onepassword-operator"
    exit 1
  '';
}
