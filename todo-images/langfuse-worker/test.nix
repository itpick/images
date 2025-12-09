{ pkgs, lib, ... }:

# TODO: Add tests for langfuse-worker image
{
  name = "langfuse-worker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for langfuse-worker"
    exit 1
  '';
}
