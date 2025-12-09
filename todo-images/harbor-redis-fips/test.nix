{ pkgs, lib, ... }:

# TODO: Add tests for harbor-redis-fips image
{
  name = "harbor-redis-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-redis-fips"
    exit 1
  '';
}
