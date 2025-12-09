{ pkgs, lib, ... }:

# TODO: Add tests for jenkins-inbound-agent image
{
  name = "jenkins-inbound-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jenkins-inbound-agent"
    exit 1
  '';
}
