{ pkgs, lib, ... }:

# TODO: Add tests for timestamp-authority image
{
  name = "timestamp-authority";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for timestamp-authority"
    exit 1
  '';
}
