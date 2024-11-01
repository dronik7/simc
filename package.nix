{
  pkgs ? import <nixpkgs> { },
}:
pkgs.stdenv.mkDerivation rec {
  pname = "simc";
  version = "thewarwithin";

  # https://github.com/simulationcraft/simc
  src = pkgs.fetchFromGitHub {
    owner = "simulationcraft";
    repo = pname;
    rev = "9054cfda7e9af087be7bc3bc8c94adae7b26fd0a";
    hash = "sha256-BbvdWUuGMkTfmgkvrSgyMm7dYqdH4XgKLk2lrm5AdYQ=";
  };

  target = "release";

  nativeBuildInputs = with pkgs; [
    cmake
    curl
    libsForQt5.qt5.qtwebengine
    libsForQt5.qt5.wrapQtAppsHook
  ];

  meta = {
    mainProgram = "SimulationCraft";
  };
}
