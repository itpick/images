{ pkgs, lib, ... }:

# TODO: Add tests for opensearch image
{
  name = "opensearch";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opensearch"
    exit 1
  '';
}
