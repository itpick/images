{ pkgs, lib, ... }:

# TODO: Add tests for k8sgpt image
{
  name = "k8sgpt";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8sgpt"
    exit 1
  '';
}
