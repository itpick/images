{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-plugin-trivy image
{
  name = "kyverno-policy-reporter-plugin-trivy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-plugin-trivy"
    exit 1
  '';
}
