{ pkgs, lib, ... }:

# TODO: Add tests for logstash image
{
  name = "logstash";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for logstash"
    exit 1
  '';
}
