{ pkgs, lib, ... }:

# TODO: Add tests for cloudprober image
{
  name = "cloudprober";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloudprober"
    exit 1
  '';
}
