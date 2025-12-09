{ pkgs, lib, ... }:

# TODO: Add tests for google-cloud-sdk image
{
  name = "google-cloud-sdk";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for google-cloud-sdk"
    exit 1
  '';
}
