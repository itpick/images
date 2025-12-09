{ pkgs, lib, ... }:

# TODO: Add tests for jre-crac image
{
  name = "jre-crac";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jre-crac"
    exit 1
  '';
}
