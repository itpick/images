{ pkgs, lib, ... }:

# TODO: Add tests for apache-beam-python-sdk image
{
  name = "apache-beam-python-sdk";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-beam-python-sdk"
    exit 1
  '';
}
