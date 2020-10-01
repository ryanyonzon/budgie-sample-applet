# Budgie Sample Applet

A sample applet for Budgie desktop environment.

So this is basically a template to get you started in Budgie applet development.

![sample_screenshot](https://raw.githubusercontent.com/rawswift/budgie-sample-applet/master/.github/screenshots/Sample.png)

## Applet build dependencies

This applet has three build dependencies that must be present in the system:

- budgie-1.0 >= 2
- gtk+-3.0 >= 3.24.0
- libpeas-gtk-1.0 >= 1.24.0

And:

- vala >= 0.46.0
- meson

Install dependencies on Solus:

    sudo eopkg install budgie-desktop-devel libgtk-3-devel libpeas-devel vala meson -c system.devel

## Cloning the repository

    git clone https://github.com/rawswift/budgie-sample-applet.git
    cd budgie-sample-applet/

## Building and installation

    meson --prefix=/usr build
    sudo ninja -C build/ install

You may need to restart your system for the newly installed applet to appear in the `Budgie Desktop Settings` > `Bottom Panel` > `Add applet` (list) or run the `budgie-panel` command (on terminal) to restore Budgie's default panel settings and for the changes to take effect:

    budgie-panel --reset --replace &

Press CTRL + D to close the terminal without closing the Budgie Panel process.
