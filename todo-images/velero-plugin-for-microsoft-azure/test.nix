{ pkgs, lib, ... }:

# TODO: Add tests for velero-plugin-for-microsoft-azure image
{
  name = "velero-plugin-for-microsoft-azure";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for velero-plugin-for-microsoft-azure"
    exit 1
  '';
}
