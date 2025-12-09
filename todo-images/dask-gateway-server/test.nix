{ pkgs, lib, ... }:

# TODO: Add tests for dask-gateway-server image
{
  name = "dask-gateway-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dask-gateway-server"
    exit 1
  '';
}
