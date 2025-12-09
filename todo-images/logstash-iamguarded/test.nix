{ pkgs, lib, ... }:

# TODO: Add tests for logstash-iamguarded image
{
  name = "logstash-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for logstash-iamguarded"
    exit 1
  '';
}
