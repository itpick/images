{ pkgs, lib, ... }:

# TODO: Add tests for logstash-oss-with-opensearch-output-plugin image
{
  name = "logstash-oss-with-opensearch-output-plugin";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for logstash-oss-with-opensearch-output-plugin"
    exit 1
  '';
}
