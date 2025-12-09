{ pkgs, lib, ... }:

# TODO: Add tests for cassandra-medusa-fips image
{
  name = "cassandra-medusa-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cassandra-medusa-fips"
    exit 1
  '';
}
