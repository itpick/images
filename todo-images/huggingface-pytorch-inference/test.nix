{ pkgs, lib, ... }:

# TODO: Add tests for huggingface-pytorch-inference image
{
  name = "huggingface-pytorch-inference";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for huggingface-pytorch-inference"
    exit 1
  '';
}
