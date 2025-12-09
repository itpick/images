{ pkgs, lib, ... }:

# TODO: Add tests for openssh-server image
{
  name = "openssh-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openssh-server"
    exit 1
  '';
}
