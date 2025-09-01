{ pkgs, image }:

pkgs.writeShellScript "test-mariadb" ''
  set -euo pipefail
  
  echo "🧪 Testing mariadb image functionality..."
  
  # Test 1: MariaDB version
  echo "  ✓ Testing mariadb version..."
  docker run --rm ${image.imageName}:test mariadbd --version | grep -q "MariaDB"
  
  # Test 2: MySQL client availability
  echo "  ✓ Testing mysql client..."
  docker run --rm ${image.imageName}:test mysql --version | grep -q "mysql"
  
  # Test 3: MariaDB admin tools
  echo "  ✓ Testing admin tools..."
  docker run --rm ${image.imageName}:test mysqladmin --version | grep -q "mysqladmin"
  
  # Test 4: Database initialization test
  echo "  ✓ Testing database initialization..."
  docker run --rm -e MYSQL_ROOT_PASSWORD=testpass ${image.imageName}:test bash -c '
    mysql_install_db --user=mysql --datadir=/tmp/mysql-data --auth-root-authentication-method=normal
  '
  
  # Test 5: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test mariadbd --help | grep -q "Usage"
  
  # Test 6: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All mariadb tests passed!"
''