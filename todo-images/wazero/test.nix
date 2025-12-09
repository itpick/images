{ pkgs, lib, ... }:

# TODO: Add tests for wazero image
{
  name = "wazero";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wazero"
    exit 1
  '';
}
