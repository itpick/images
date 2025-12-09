{ pkgs, lib, ... }:

# TODO: Add tests for newrelic-fluent-bit-output image
{
  name = "newrelic-fluent-bit-output";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for newrelic-fluent-bit-output"
    exit 1
  '';
}
