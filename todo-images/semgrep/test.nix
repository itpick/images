{ pkgs, lib, ... }:

# TODO: Add tests for semgrep image
{
  name = "semgrep";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for semgrep"
    exit 1
  '';
}
