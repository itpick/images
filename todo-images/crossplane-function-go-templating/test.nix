{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-function-go-templating image
{
  name = "crossplane-function-go-templating";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-function-go-templating"
    exit 1
  '';
}
