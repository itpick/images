{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-tuf-server image
{
  name = "sigstore-scaffolding-tuf-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-tuf-server"
    exit 1
  '';
}
