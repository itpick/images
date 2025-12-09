{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-rekor-createsecret-fips image
{
  name = "sigstore-scaffolding-rekor-createsecret-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-rekor-createsecret-fips"
    exit 1
  '';
}
