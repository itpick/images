{ pkgs, lib, ... }:

# TODO: Add tests for yara image
{
  name = "yara";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for yara"
    exit 1
  '';
}
