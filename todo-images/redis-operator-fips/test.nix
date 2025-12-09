{ pkgs, lib, ... }:

# TODO: Add tests for redis-operator-fips image
{
  name = "redis-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-operator-fips"
    exit 1
  '';
}
