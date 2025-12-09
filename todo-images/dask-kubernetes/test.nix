{ pkgs, lib, ... }:

# TODO: Add tests for dask-kubernetes image
{
  name = "dask-kubernetes";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dask-kubernetes"
    exit 1
  '';
}
