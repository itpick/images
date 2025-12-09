{ pkgs, lib, ... }:

# TODO: Add tests for airflow-iamguarded image
{
  name = "airflow-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for airflow-iamguarded"
    exit 1
  '';
}
