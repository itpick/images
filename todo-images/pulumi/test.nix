{ pkgs, lib, ... }:

# TODO: Add tests for pulumi image
{
  name = "pulumi";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pulumi"
    exit 1
  '';
}
