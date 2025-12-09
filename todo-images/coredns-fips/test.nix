{ pkgs, lib, ... }:

# TODO: Add tests for coredns-fips image
{
  name = "coredns-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for coredns-fips"
    exit 1
  '';
}
