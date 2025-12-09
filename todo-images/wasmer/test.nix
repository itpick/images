{ pkgs, lib, ... }:

# TODO: Add tests for wasmer image
{
  name = "wasmer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wasmer"
    exit 1
  '';
}
