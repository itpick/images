{ pkgs, lib, ... }:

# TODO: Add tests for rclone-fips image
{
  name = "rclone-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rclone-fips"
    exit 1
  '';
}
