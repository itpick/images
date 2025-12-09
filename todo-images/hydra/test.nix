{ pkgs, lib, ... }:

# TODO: Add tests for hydra image
{
  name = "hydra";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for hydra"
    exit 1
  '';
}
