{ pkgs, lib, ... }:

# TODO: Add tests for rsyslog image
{
  name = "rsyslog";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rsyslog"
    exit 1
  '';
}
