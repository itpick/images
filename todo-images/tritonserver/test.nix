{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver image
{
  name = "tritonserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver"
    exit 1
  '';
}
