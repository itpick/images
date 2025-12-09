{ pkgs, lib, ... }:

# TODO: Add tests for filebeat image
{
  name = "filebeat";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for filebeat"
    exit 1
  '';
}
