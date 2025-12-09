{ pkgs, lib, ... }:

# TODO: Add tests for quic-go-fips image
{
  name = "quic-go-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for quic-go-fips"
    exit 1
  '';
}
