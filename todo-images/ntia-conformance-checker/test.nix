{ pkgs, lib, ... }:

# TODO: Add tests for ntia-conformance-checker image
{
  name = "ntia-conformance-checker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ntia-conformance-checker"
    exit 1
  '';
}
