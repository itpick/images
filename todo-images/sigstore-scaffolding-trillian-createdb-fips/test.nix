{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-trillian-createdb-fips image
{
  name = "sigstore-scaffolding-trillian-createdb-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-trillian-createdb-fips"
    exit 1
  '';
}
