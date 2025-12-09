{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter image
{
  name = "kyverno-policy-reporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter"
    exit 1
  '';
}
