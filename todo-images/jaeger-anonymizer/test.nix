{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-anonymizer image
{
  name = "jaeger-anonymizer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-anonymizer"
    exit 1
  '';
}
