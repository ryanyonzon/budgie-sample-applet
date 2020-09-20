# Budgie Sample Applet

custom_target('plugin-file-sample-applet',
    input : 'SampleApplet.plugin.in',
    output : 'SampleApplet.plugin',
    command : [intltool, '--desktop-style', podir, '@INPUT@', '@OUTPUT@'],
    install : true,
    install_dir : applets_dir)

applet_source = [
    'SampleApplet.vala'
]

applet_deps = [
    dep_budgie,
    dep_peas,
    dep_gtk3
]

shared_library(
    'sampleapplet',
    applet_source,
    dependencies: applet_deps,
    vala_args: [
        '--pkg', 'libpeas-1.0',
        '--pkg', 'gtk+-3.0',
    ],
    install: true,
    install_dir: applets_dir
)
