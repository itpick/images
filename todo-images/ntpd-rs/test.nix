{ pkgs, lib, ... }:

# TODO: Add tests for ntpd-rs image
{
  name = "ntpd-rs";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ntpd-rs"
    exit 1
  '';
}
