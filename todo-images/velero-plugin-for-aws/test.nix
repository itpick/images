{ pkgs, lib, ... }:

# TODO: Add tests for velero-plugin-for-aws image
{
  name = "velero-plugin-for-aws";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for velero-plugin-for-aws"
    exit 1
  '';
}
