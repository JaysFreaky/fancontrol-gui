{ lib
, stdenv
, fetchFromGitHub
, cmake
, extra-cmake-modules
, gcc
, gettext
, libsForQt5
}:

stdenv.mkDerivation rec {
  pname = "fancontrol_gui";
  version = "0.8";

  src = fetchFromGitHub {
    owner = "Maldela";
    repo  = "Fancontrol-GUI";
    rev   = "v${version}";
    hash  = "sha256-hJaU8SL0b6GmTONGSIzUzzbex6KxHf2Np0bCX8YSSVM=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    gcc
    gettext
    libsForQt5.qt5.wrapQtAppsHook
  ];

  buildInputs = with libsForQt5; [
    kauth
    kcmutils
    kconfig
    kconfigwidgets
    kcoreaddons
    kdbusaddons
    kdeclarative
    kdelibs4support
    ki18n
    kirigami2
    knotifications
    kpackage
    plasma-framework
    qt5.qtbase
    qt5.qtquickcontrols
    qt5.qtquickcontrols2
  ];

  cmakeFlags = [
    "-DBUILD_KCM=on"
    "-DBUILD_PLASMOID=on"
  ];

  meta = {
    homepage = "https://github.com/Maldela/fancontrol-gui";
    description = "GUI for lmsensor's fancontrol";
    longDescription = ''
      GUI for Fancontrol. It uses the KAuth module of the KDE Frameworks 5 to write the generated config file. Furthermore it communicates with systemd via dbus to control the fancontrol service. If you want to compile without systemd support set the -DNO_SYSTEMD option. 
    '';
    changelog = "https://github.com/Maldela/fancontrol-gui/releases/tag/${src.rev}";
    license = lib.licenses.gpl2;
    maintainers = [ "JaysFreaky" ];
    platforms = lib.platforms.linux;
  };
}
