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
    rev = "20093141406da828118beff9b795a0f4a72db684";
    hash = "sha256-HShnYblhi1SK0WJTj/tnKNL6Jw6h7l5ZZmCzG9avEss=";
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
