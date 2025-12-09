{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-no-backend image
{
  name = "tritonserver-no-backend";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-no-backend"
    exit 1
  '';
}
