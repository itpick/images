{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-sql image
{
  name = "crossplane-sql";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-sql"
    exit 1
  '';
}
