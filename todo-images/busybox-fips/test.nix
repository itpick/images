{ pkgs, lib, ... }:

# TODO: Add tests for busybox-fips image
{
  name = "busybox-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for busybox-fips"
    exit 1
  '';
}
