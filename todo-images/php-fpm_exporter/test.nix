{ pkgs, lib, ... }:

# TODO: Add tests for php-fpm_exporter image
{
  name = "php-fpm_exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for php-fpm_exporter"
    exit 1
  '';
}
