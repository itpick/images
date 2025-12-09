{ pkgs, lib, ... }:

# TODO: Add tests for powershell image
{
  name = "powershell";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for powershell"
    exit 1
  '';
}
