{ pkgs, lib, ... }:

# TODO: Add tests for tesseract image
{
  name = "tesseract";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tesseract"
    exit 1
  '';
}
