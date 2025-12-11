# Custom packages for nix-containers
# These packages are not available in nixpkgs and are built from source or binary distributions

{ pkgs }:

{
  apache-nifi = pkgs.callPackage ./apache-nifi { };
  cert-manager = pkgs.callPackage ./cert-manager { };
  cilium = pkgs.callPackage ./cilium { };
  cilium-certgen = pkgs.callPackage ./certgen { };
  cloudnative-pg = pkgs.callPackage ./cloudnative-pg { };
  configmap-reload = pkgs.callPackage ./configmap-reload { };
  crossplane-server = pkgs.callPackage ./crossplane { };
  hubble-ui = pkgs.callPackage ./hubble-ui { };
  istio = pkgs.callPackage ./istio { };
  keda = pkgs.callPackage ./keda { };
  kube-rbac-proxy = pkgs.callPackage ./kube-rbac-proxy { };

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
  font-noto-emoji = pkgs.noto-fonts-emoji;
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
