{ pkgs, lib, ... }:

# TODO: Add tests for langfuse image
{
  name = "langfuse";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for langfuse"
    exit 1
  '';
}
