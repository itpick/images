{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-fulcio-createcerts-fips image
{
  name = "sigstore-scaffolding-fulcio-createcerts-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-fulcio-createcerts-fips"
    exit 1
  '';
}
