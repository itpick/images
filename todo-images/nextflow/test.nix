{ pkgs, lib, ... }:

# TODO: Add tests for nextflow image
{
  name = "nextflow";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nextflow"
    exit 1
  '';
}
