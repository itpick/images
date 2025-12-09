{ pkgs, lib, ... }:

# TODO: Add tests for wasmtime image
{
  name = "wasmtime";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wasmtime"
    exit 1
  '';
}
