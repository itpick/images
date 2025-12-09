{ pkgs, lib, ... }:

# TODO: Add tests for aws-otel-collector image
{
  name = "aws-otel-collector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-otel-collector"
    exit 1
  '';
}
