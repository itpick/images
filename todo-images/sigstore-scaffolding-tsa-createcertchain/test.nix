{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-tsa-createcertchain image
{
  name = "sigstore-scaffolding-tsa-createcertchain";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-tsa-createcertchain"
    exit 1
  '';
}
