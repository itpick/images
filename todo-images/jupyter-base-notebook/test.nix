{ pkgs, lib, ... }:

# TODO: Add tests for jupyter-base-notebook image
{
  name = "jupyter-base-notebook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jupyter-base-notebook"
    exit 1
  '';
}
