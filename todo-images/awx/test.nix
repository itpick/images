{ pkgs, lib, ... }:

# TODO: Add tests for awx image
{
  name = "awx";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for awx"
    exit 1
  '';
}
