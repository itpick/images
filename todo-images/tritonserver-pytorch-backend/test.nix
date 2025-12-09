{ pkgs, lib, ... }:

# TODO: Add tests for tritonserver-pytorch-backend image
{
  name = "tritonserver-pytorch-backend";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tritonserver-pytorch-backend"
    exit 1
  '';
}
