{ pkgs, lib, ... }:

# TODO: Add tests for bento image
{
  name = "bento";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for bento"
    exit 1
  '';
}
