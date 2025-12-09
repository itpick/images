{ pkgs, lib, ... }:

# TODO: Add tests for apache-activemq-artemis image
{
  name = "apache-activemq-artemis";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-activemq-artemis"
    exit 1
  '';
}
