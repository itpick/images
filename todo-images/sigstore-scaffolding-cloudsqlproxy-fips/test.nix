{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-cloudsqlproxy-fips image
{
  name = "sigstore-scaffolding-cloudsqlproxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-cloudsqlproxy-fips"
    exit 1
  '';
}
