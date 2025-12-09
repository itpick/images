{ pkgs, lib, ... }:

# TODO: Add tests for cass-config-builder image
{
  name = "cass-config-builder";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cass-config-builder"
    exit 1
  '';
}
