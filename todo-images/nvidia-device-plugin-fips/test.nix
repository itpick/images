{ pkgs, lib, ... }:

# TODO: Add tests for nvidia-device-plugin-fips image
{
  name = "nvidia-device-plugin-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nvidia-device-plugin-fips"
    exit 1
  '';
}
