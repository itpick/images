{ pkgs, lib, ... }:

# TODO: Add tests for amazon-corretto-jre image
{
  name = "amazon-corretto-jre";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-corretto-jre"
    exit 1
  '';
}
