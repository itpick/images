{ pkgs, lib, ... }:

# TODO: Add tests for trivy image
{
  name = "trivy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trivy"
    exit 1
  '';
}
