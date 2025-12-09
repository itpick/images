{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-trillian-createtree-fips image
{
  name = "sigstore-scaffolding-trillian-createtree-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-trillian-createtree-fips"
    exit 1
  '';
}
