{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-trillian-updatetree-fips image
{
  name = "sigstore-scaffolding-trillian-updatetree-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-trillian-updatetree-fips"
    exit 1
  '';
}
