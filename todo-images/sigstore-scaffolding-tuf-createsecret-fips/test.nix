{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-tuf-createsecret-fips image
{
  name = "sigstore-scaffolding-tuf-createsecret-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-tuf-createsecret-fips"
    exit 1
  '';
}
