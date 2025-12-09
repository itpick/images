{ pkgs, lib, ... }:

# TODO: Add tests for thanos-iamguarded-client image
{
  name = "thanos-iamguarded-client";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-iamguarded-client"
    exit 1
  '';
}
