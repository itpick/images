{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-ui image
{
  name = "kyverno-policy-reporter-ui";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-ui"
    exit 1
  '';
}
