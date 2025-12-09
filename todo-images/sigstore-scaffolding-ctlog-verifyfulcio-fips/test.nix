{ pkgs, lib, ... }:

# TODO: Add tests for sigstore-scaffolding-ctlog-verifyfulcio-fips image
{
  name = "sigstore-scaffolding-ctlog-verifyfulcio-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sigstore-scaffolding-ctlog-verifyfulcio-fips"
    exit 1
  '';
}
