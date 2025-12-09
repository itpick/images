{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-getoidctoken image
{
  name = "sigstore-scaffolding-getoidctoken";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-getoidctoken"
    exit 1
  '';
}
