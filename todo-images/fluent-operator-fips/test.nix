{ pkgs, lib, ... }:

# TODO: Add tests for fluent-operator-fips image
{
  name = "fluent-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluent-operator-fips"
    exit 1
  '';
}
