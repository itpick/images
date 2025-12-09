{ pkgs, lib, ... }:

# TODO: Add tests for rekor-backfill-index-fips image
{
  name = "rekor-backfill-index-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rekor-backfill-index-fips"
    exit 1
  '';
}
