# Budgie Sample Applet

project('budgie-sample-applet',
        ['vala', 'c'],
        version: '1.0.0'
)

am_cflags = [
    '-fstack-protector',
    '-pedantic',
    '-Wstrict-prototypes',
    '-Wundef',
    '-Werror-implicit-function-declaration',
    '-Wformat',
    '-Wformat-security',
    '-Werror=format-security',
    '-Wconversion',
    '-Wunused-variable',
    '-Wunreachable-code',
    '-Wall',
    '-W'
]

add_global_arguments(am_cflags, language: 'c')

# Budgie needs a minimum 3.24 GNOME stack
gnome_minimum_version = '>= 3.24.0'

# Dependencies
dep_budgie = dependency('budgie-1.0')
dep_gtk3 = dependency('gtk+-3.0', version: gnome_minimum_version)
dep_peas = dependency('libpeas-1.0', version: '>= 1.24.0')

intltool = find_program('intltool-merge')
podir = join_paths(meson.source_root(), 'po')

# Installation directory
prefix = get_option('prefix')
libdir = join_paths(prefix, get_option('libdir'))
plugin_libdir = join_paths(libdir, 'budgie-desktop', 'plugins')

applet_namespace = 'com.github.rawswift.budgie-sample-applet'
applets_dir = join_paths(plugin_libdir, applet_namespace)

subdir('src')
