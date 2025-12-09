{ pkgs, lib, ... }:

# TODO: Add tests for fluent-bit-fips image
{
  name = "fluent-bit-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluent-bit-fips"
    exit 1
  '';
}
