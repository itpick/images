{ pkgs, lib, ... }:

# TODO: Add tests for secretgen-controller image
{
  name = "secretgen-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for secretgen-controller"
    exit 1
  '';
}
