{ pkgs, lib, ... }:

# TODO: Add tests for airflow image
{
  name = "airflow";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for airflow"
    exit 1
  '';
}
