{ pkgs, lib, ... }:

# TODO: Add tests for redis-fips image
{
  name = "redis-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-fips"
    exit 1
  '';
}
