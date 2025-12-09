{ pkgs, lib, ... }:

# TODO: Add tests for aws-for-fluent-bit image
{
  name = "aws-for-fluent-bit";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-for-fluent-bit"
    exit 1
  '';
}
