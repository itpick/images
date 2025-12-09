{ pkgs, lib, ... }:

# TODO: Add tests for quic-go image
{
  name = "quic-go";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for quic-go"
    exit 1
  '';
}
