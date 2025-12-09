{ pkgs, lib, ... }:

# TODO: Add tests for calico-apiserver image
{
  name = "calico-apiserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-apiserver"
    exit 1
  '';
}
