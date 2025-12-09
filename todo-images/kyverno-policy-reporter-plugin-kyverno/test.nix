{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-plugin-kyverno image
{
  name = "kyverno-policy-reporter-plugin-kyverno";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-plugin-kyverno"
    exit 1
  '';
}
