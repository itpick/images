{ pkgs, lib, ... }:

# TODO: Add tests for cassandra-fips image
{
  name = "cassandra-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cassandra-fips"
    exit 1
  '';
}
