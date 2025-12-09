{ pkgs, lib, ... }:

# TODO: Add tests for cloud-provider-aws image
{
  name = "cloud-provider-aws";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-provider-aws"
    exit 1
  '';
}
