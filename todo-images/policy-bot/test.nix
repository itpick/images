{ pkgs, lib, ... }:

# TODO: Add tests for policy-bot image
{
  name = "policy-bot";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for policy-bot"
    exit 1
  '';
}
