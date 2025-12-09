{ pkgs, lib, ... }:

# TODO: Add tests for velero-plugin-for-microsoft-azure-fips image
{
  name = "velero-plugin-for-microsoft-azure-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for velero-plugin-for-microsoft-azure-fips"
    exit 1
  '';
}
