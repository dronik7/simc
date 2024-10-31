{
  pkgs ? import <nixpkgs> { },
}:
pkgs.stdenv.mkDerivation rec {
  pname = "simc";
  version = "0";

  src = pkgs.fetchFromGitHub {
    owner = "simulationcraft";
    repo = pname;
    rev = "d62e149c49b91e344630297b1ddedf9b66ecd162";
    hash = "sha256-HShnYblhi1SK0WJTj/tnKNL6Jw6h7l5ZZmCzG9avEss=";
  };

  nativeBuildInputs = with pkgs; [
    cmake
    curl
    libsForQt5.qt5.qtwebengine
    libsForQt5.qt5.wrapQtAppsHook
  ];
}
