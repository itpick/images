{ pkgs, lib, ... }:

# TODO: Add tests for nats-box-fips image
{
  name = "nats-box-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nats-box-fips"
    exit 1
  '';
}
