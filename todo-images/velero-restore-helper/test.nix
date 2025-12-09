{ pkgs, lib, ... }:

# TODO: Add tests for velero-restore-helper image
{
  name = "velero-restore-helper";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for velero-restore-helper"
    exit 1
  '';
}
