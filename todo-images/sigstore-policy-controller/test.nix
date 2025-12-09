{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-policy-controller image
{
  name = "sigstore-policy-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-policy-controller"
    exit 1
  '';
}
