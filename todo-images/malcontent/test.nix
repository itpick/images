{ pkgs, lib, ... }:

# TODO: Add tests for malcontent image
{
  name = "malcontent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for malcontent"
    exit 1
  '';
}
