{ pkgs, lib, ... }:

# TODO: Add tests for octo-sts image
{
  name = "octo-sts";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for octo-sts"
    exit 1
  '';
}
