{ pkgs, lib, ... }:

# TODO: Add tests for tflint image
{
  name = "tflint";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tflint"
    exit 1
  '';
}
