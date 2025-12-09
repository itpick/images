{ pkgs, lib, ... }:

# TODO: Add tests for test-tmp-client image
{
  name = "test-tmp-client";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for test-tmp-client"
    exit 1
  '';
}
