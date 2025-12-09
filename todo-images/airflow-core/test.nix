{ pkgs, lib, ... }:

# TODO: Add tests for airflow-core image
{
  name = "airflow-core";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for airflow-core"
    exit 1
  '';
}
