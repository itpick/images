{ pkgs, lib, ... }:

# TODO: Add tests for ip-masq-agent image
{
  name = "ip-masq-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ip-masq-agent"
    exit 1
  '';
}
