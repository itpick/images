{ pkgs, lib, ... }:

# TODO: Add tests for clamav image
{
  name = "clamav";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clamav"
    exit 1
  '';
}
