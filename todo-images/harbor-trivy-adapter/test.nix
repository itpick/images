{ pkgs, lib, ... }:

# TODO: Add tests for harbor-trivy-adapter image
{
  name = "harbor-trivy-adapter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-trivy-adapter"
    exit 1
  '';
}
