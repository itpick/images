{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-admission-webhook image
{
  name = "prometheus-admission-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-admission-webhook"
    exit 1
  '';
}
