{ pkgs, lib, ... }:

# TODO: Add tests for google-cloud-sdk-iamguarded-fips image
{
  name = "google-cloud-sdk-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for google-cloud-sdk-iamguarded-fips"
    exit 1
  '';
}
