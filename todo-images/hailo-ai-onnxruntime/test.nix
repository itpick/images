{ pkgs, lib, ... }:

# TODO: Add tests for hailo-ai-onnxruntime image
{
  name = "hailo-ai-onnxruntime";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for hailo-ai-onnxruntime"
    exit 1
  '';
}
