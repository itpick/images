{ pkgs, image }:

pkgs.writeShellScript "test-haproxy" ''
  set -euo pipefail
  
  echo "🧪 Testing haproxy image functionality..."
  
  # Test 1: HAProxy version
  echo "  ✓ Testing haproxy version..."
  docker run --rm ${image.imageName}:test haproxy -v | grep -q "HAProxy version"
  
  # Test 2: Configuration test
  echo "  ✓ Testing configuration validation..."
  docker run --rm ${image.imageName}:test bash -c '
    cat > /tmp/haproxy.cfg << EOF
global
    daemon
defaults
    mode http
    timeout connect 5000ms
    timeout client 50000ms
    timeout server 50000ms
frontend http_front
    bind *:80
    default_backend http_back
backend http_back
    balance roundrobin
    server web1 127.0.0.1:8080 check
EOF
    haproxy -f /tmp/haproxy.cfg -c
  '
  
  # Test 3: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test haproxy --help 2>&1 | grep -q "Usage"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All haproxy tests passed!"
''