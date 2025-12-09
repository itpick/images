{ pkgs, lib, ... }:

# TODO: Add tests for rclone image
{
  name = "rclone";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rclone"
    exit 1
  '';
}
