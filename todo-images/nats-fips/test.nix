{ pkgs, lib, ... }:

# TODO: Add tests for nats-fips image
{
  name = "nats-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nats-fips"
    exit 1
  '';
}
