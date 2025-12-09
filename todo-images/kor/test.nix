{ pkgs, lib, ... }:

# TODO: Add tests for kor image
{
  name = "kor";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kor"
    exit 1
  '';
}
