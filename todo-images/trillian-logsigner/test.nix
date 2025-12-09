{ pkgs, lib, ... }:

# TODO: Add tests for trillian-logsigner image
{
  name = "trillian-logsigner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trillian-logsigner"
    exit 1
  '';
}
