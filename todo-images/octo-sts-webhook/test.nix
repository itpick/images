{ pkgs, lib, ... }:

# TODO: Add tests for octo-sts-webhook image
{
  name = "octo-sts-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for octo-sts-webhook"
    exit 1
  '';
}
