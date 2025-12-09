{ pkgs, lib, ... }:

# TODO: Add tests for trufflehog image
{
  name = "trufflehog";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trufflehog"
    exit 1
  '';
}
