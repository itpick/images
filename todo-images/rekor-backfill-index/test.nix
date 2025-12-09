{ pkgs, lib, ... }:

# TODO: Add tests for rekor-backfill-index image
{
  name = "rekor-backfill-index";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rekor-backfill-index"
    exit 1
  '';
}
