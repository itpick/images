{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-ctlog-managectroots-fips image
{
  name = "sigstore-scaffolding-ctlog-managectroots-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-ctlog-managectroots-fips"
    exit 1
  '';
}
