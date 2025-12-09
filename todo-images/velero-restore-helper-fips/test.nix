{ pkgs, lib, ... }:

# TODO: Add tests for velero-restore-helper-fips image
{
  name = "velero-restore-helper-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for velero-restore-helper-fips"
    exit 1
  '';
}
