{ pkgs, lib, ... }:

# TODO: Add tests for cilium-certgen image
{
  name = "cilium-certgen";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-certgen"
    exit 1
  '';
}
