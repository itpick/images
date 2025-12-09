{ pkgs, lib, ... }:

# TODO: Add tests for code-server image
{
  name = "code-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for code-server"
    exit 1
  '';
}
