# Custom packages for nix-containers
# These packages are not available in nixpkgs and are built from source or binary distributions

{ pkgs }:

{
  # Kubernetes ecosystem packages
  amazon-vpc-cni = pkgs.callPackage ./amazon-vpc-cni { };
  apache-nifi = pkgs.callPackage ./apache-nifi { };
  argo-events = pkgs.callPackage ./argo-events { };
  argo-rollouts = pkgs.callPackage ./argo-rollouts { };
  argo-workflows = pkgs.callPackage ./argo-workflows { };
  argo-workflows-fips = pkgs.callPackage ./argo-workflows-fips { };
  argocd-image-updater = pkgs.callPackage ./argocd-image-updater { };
  aws-ebs-csi-driver = pkgs.callPackage ./aws-ebs-csi-driver { };
  aws-efs-csi-driver = pkgs.callPackage ./aws-efs-csi-driver { };
  aws-load-balancer-controller = pkgs.callPackage ./aws-load-balancer-controller { };
  aws-node-termination-handler = pkgs.callPackage ./aws-node-termination-handler { };
  bank-vaults = pkgs.callPackage ./bank-vaults { };
  cert-manager = pkgs.callPackage ./cert-manager { };
  cilium = pkgs.callPackage ./cilium { };
  cilium-certgen = pkgs.callPackage ./certgen { };
  cloudnative-pg = pkgs.callPackage ./cloudnative-pg { };
  cluster-autoscaler = pkgs.callPackage ./cluster-autoscaler { };
  cluster-proportional-autoscaler = pkgs.callPackage ./cluster-proportional-autoscaler { };
  configmap-reload = pkgs.callPackage ./configmap-reload { };
  contour = pkgs.callPackage ./contour { };
  coredns = pkgs.callPackage ./coredns { };
  crossplane-server = pkgs.callPackage ./crossplane { };
  csi-attacher = pkgs.callPackage ./csi-attacher { };
  csi-driver-nfs = pkgs.callPackage ./csi-driver-nfs { };
  csi-driver-smb = pkgs.callPackage ./csi-driver-smb { };
  csi-node-driver-registrar = pkgs.callPackage ./csi-node-driver-registrar { };
  csi-provisioner = pkgs.callPackage ./csi-provisioner { };
  csi-resizer = pkgs.callPackage ./csi-resizer { };
  dex = pkgs.callPackage ./dex { };
  # Override nixpkgs' dragonflydb: it builds from source (1.34.2) and the
  # vendored abseil_cpp build fails with no cache hit. Use upstream prebuilt
  # binary (1.39.0) until nixpkgs ships a working derivation.
  dragonflydb = pkgs.callPackage ./dragonflydb { };
  # Override nixpkgs' forgejo: bump to 15.0.3 ahead of nixpkgs 15.0.1.
  # Uses the upstream statically-linked prebuilt binary.
  forgejo = pkgs.callPackage ./forgejo { };
  # Override nixpkgs' pulumi: bump to 3.246.0 ahead of nixpkgs 3.192.0.
  # Uses the upstream statically-linked prebuilt binary.
  pulumi = pkgs.callPackage ./pulumi { };
  external-secrets = pkgs.callPackage ./external-secrets { };
  flux = pkgs.callPackage ./flux { };
  flux-source-watcher = pkgs.callPackage ./flux-source-watcher { };
  hubble-ui = pkgs.callPackage ./hubble-ui { };
  ingress-nginx-controller = pkgs.callPackage ./ingress-nginx-controller { };
  istio = pkgs.callPackage ./istio { };
  karpenter = pkgs.callPackage ./karpenter { };
  keda = pkgs.callPackage ./keda { };
  kube-rbac-proxy = pkgs.callPackage ./kube-rbac-proxy { };
  kube-state-metrics = pkgs.callPackage ./kube-state-metrics { };
  kubernetes-dashboard = pkgs.callPackage ./kubernetes-dashboard { };
  kyverno = pkgs.callPackage ./kyverno { };
  linkerd = pkgs.callPackage ./linkerd { };
  livenessprobe = pkgs.callPackage ./livenessprobe { };
  loki = pkgs.callPackage ./loki { };
  metallb = pkgs.callPackage ./metallb { };
  metrics-server = pkgs.callPackage ./metrics-server { };
  mimir = pkgs.callPackage ./mimir { };
  node-feature-discovery = pkgs.callPackage ./node-feature-discovery { };
  oauth2-proxy = pkgs.callPackage ./oauth2-proxy { };
  openfga = pkgs.callPackage ./openfga { };
  prometheus-adapter = pkgs.callPackage ./prometheus-adapter { };
  reloader = pkgs.callPackage ./reloader { };
  rustfs = pkgs.callPackage ./rustfs { };
  sealed-secrets = pkgs.callPackage ./sealed-secrets { };
  sig-storage-local-static-provisioner = pkgs.callPackage ./sig-storage-local-static-provisioner { };
  snapshot-controller = pkgs.callPackage ./snapshot-controller { };
  spire = pkgs.callPackage ./spire { };
  tempo = pkgs.callPackage ./tempo { };
  thanos = pkgs.callPackage ./thanos { };
  traefik = pkgs.callPackage ./traefik { };
  trivy = pkgs.callPackage ./trivy { };
  trust-manager = pkgs.callPackage ./trust-manager { };
  velero = pkgs.callPackage ./velero { };
  velero-plugin-for-gcp = pkgs.callPackage ./velero-plugin-for-gcp { };
  vertical-pod-autoscaler = pkgs.callPackage ./vertical-pod-autoscaler { };
  # Override nixpkgs' vector: bump to 0.56.0 ahead of nixpkgs 0.55.0.
  # Uses the upstream statically-linked musl prebuilt binary.
  vector = pkgs.callPackage ./vector { };
  # Override nixpkgs' victoriametrics: bump core to v1.145.0 ahead of nixpkgs
  victoriametrics = pkgs.callPackage ./victoriametrics { };
  victoriametrics-cluster = pkgs.callPackage ./victoriametrics-cluster { };
  victoriametrics-cluster-fips = pkgs.callPackage ./victoriametrics-cluster-fips { };
  victoriametrics-fips = pkgs.callPackage ./victoriametrics-fips { };
  victoriametrics-operator = pkgs.callPackage ./victoriametrics-operator { };
  victoriametrics-operator-fips = pkgs.callPackage ./victoriametrics-operator-fips { };
  victoriametrics-utils-fips = pkgs.callPackage ./victoriametrics-utils-fips { };
  zitadel-login = pkgs.callPackage ./zitadel-login { };

  # Font packages - aliases to nixpkgs fonts
  font-abyssinica = pkgs.sil-abyssinica;
  font-amiri = pkgs.amiri;
  font-ipa = pkgs.ipafont;
  font-ipafont-gothic = pkgs.ipafont;
  font-ipafont-mincho = pkgs.ipafont;
  font-liberation = pkgs.liberation_ttf;
  font-linux-libertine = pkgs.libertine;
  font-lklug = pkgs.lklug-sinhala;
  font-lohit-beng-assamese = pkgs.lohit-fonts.assamese;
  font-lohit-beng-bengali = pkgs.lohit-fonts.bengali;
  font-lohit-beng-extra = pkgs.lohit-fonts.bengali;
  font-lohit-guru = pkgs.lohit-fonts.gurmukhi;
  font-lohit-knda = pkgs.lohit-fonts.kannada;
  font-misc = pkgs.xorg.fontmiscmisc;
  font-noto = pkgs.noto-fonts;
  font-noto-cjk = pkgs.noto-fonts-cjk-sans;
  font-noto-common = pkgs.noto-fonts;
  font-noto-emoji = pkgs.noto-fonts-color-emoji;
  font-noto-math = pkgs.noto-fonts;
  font-noto-symbols = pkgs.noto-fonts;
  font-opensans = pkgs.open-sans;
  font-padauk = pkgs.sil-padauk;
  font-samyak-devanagari = pkgs.lohit-fonts.devanagari;
  font-samyak-gujarati = pkgs.lohit-fonts.gujarati;
  font-samyak-malayalam = pkgs.lohit-fonts.malayalam;
  font-samyak-oriya = pkgs.lohit-fonts.odia;
  font-samyak-tamil = pkgs.lohit-fonts.tamil;
  font-tlwg = pkgs.tlwg;
  font-ubuntu = pkgs.ubuntu-classic;
  font-unfonts-core = pkgs.unfonts-core;
  font-wqy-zenhei = pkgs.wqy_zenhei;
  ttf-arphic-ukai = pkgs.arphic-ukai;
  ttf-arphic-uming = pkgs.arphic-uming;
  ttf-dejavu = pkgs.dejavu_fonts;
}
