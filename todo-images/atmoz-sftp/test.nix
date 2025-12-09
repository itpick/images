{ pkgs, lib, ... }:

# TODO: Add tests for atmoz-sftp image
{
  name = "atmoz-sftp";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for atmoz-sftp"
    exit 1
  '';
}
