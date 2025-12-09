{ pkgs, lib, ... }:

# TODO: Add tests for thanos-receive-controller image
{
  name = "thanos-receive-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-receive-controller"
    exit 1
  '';
}
