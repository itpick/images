{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-plugin image
{
  name = "kyverno-policy-reporter-plugin";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-plugin"
    exit 1
  '';
}
