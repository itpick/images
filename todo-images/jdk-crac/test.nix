{ pkgs, lib, ... }:

# TODO: Add tests for jdk-crac image
{
  name = "jdk-crac";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jdk-crac"
    exit 1
  '';
}
