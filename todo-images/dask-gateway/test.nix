{ pkgs, lib, ... }:

# TODO: Add tests for dask-gateway image
{
  name = "dask-gateway";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dask-gateway"
    exit 1
  '';
}
