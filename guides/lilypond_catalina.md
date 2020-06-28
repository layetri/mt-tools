# LilyPond on macOS Catalina
This is a short guide that should get you set up quickly running LilyPond on macOS Catalina and up.

### Tools
You need MacPorts, which can be downloaded here: https://github.com/macports/macports-base/releases.

### Installation
After you've installed MacPorts, open a terminal. Type the following command:
``sudo port install lilypond``. It'll ask for your password. Enter it and wait for installation to finish.

### Setup for Frescobaldi
To use this new installation in Frescobaldi, go to `Preferences` -> `LilyPond preferences` and click "Add". In the "LilyPond command" box, type `/opt/local/bin/lilypond`. Then click OK twice. LilyPond is now ready to use.