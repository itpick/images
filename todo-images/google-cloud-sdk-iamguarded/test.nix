{ pkgs, lib, ... }:

# TODO: Add tests for google-cloud-sdk-iamguarded image
{
  name = "google-cloud-sdk-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for google-cloud-sdk-iamguarded"
    exit 1
  '';
}
