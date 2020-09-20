/**
 * Copyright 2020 Ryan Yonzon
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 * and associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial
 * portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
 * NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/* Applet icon */
public const string APPLET_ICON = "user-available";

/**
 * Native panel applet requires a factory function to create a new Budgie.Applet instance
 */
public class Plugin : Budgie.Plugin, Peas.ExtensionBase {
    public Budgie.Applet get_panel_widget(string uuid) {
        return new SampleApplet(uuid);
    }
}

/**
 * Applet implementation
 */
public class SampleApplet : Budgie.Applet {

    public string uuid { public set ; public get; }

    protected Gtk.EventBox? ebox;
    protected Gtk.Image image;
    protected Gtk.Box container;
    protected Gtk.Label hello_label;
    protected Budgie.Popover popover;

    /* Use to register popovers in the system panel */
    private unowned Budgie.PopoverManager? manager = null;

    public SampleApplet(string uuid) {

        Object(uuid: uuid);

        /* Eventbox */
        ebox = new Gtk.EventBox();
        image = new Gtk.Image.from_icon_name(APPLET_ICON, Gtk.IconSize.MENU);
        ebox.add(image); 

        /* Popover content */
        container = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        container.get_style_context().add_class("container");

        hello_label = new Gtk.Label("Hello, world!");
        hello_label.set_halign(Gtk.Align.START);

        container.add(hello_label);

        /* Popover menu */
        popover = new Budgie.Popover(image);
        popover.get_style_context().add_class("user-menu");
        popover.add(container);
        popover.get_child().show_all();

        /* Catch click event */
        ebox.button_press_event.connect((e)=> {
            if (e.button != 1) {
                return Gdk.EVENT_PROPAGATE;
            }
            if (popover.get_visible()) {
                popover.hide();
            } else {
                popover.get_child().show_all();
                this.manager.show_popover(ebox);
            }
            return Gdk.EVENT_STOP;
        });

        add(ebox);

        show_all();
    }

    /**
     * Register popovers
     */
    public override void update_popovers(Budgie.PopoverManager? manager) {
        this.manager = manager;
        manager.register_popover(ebox, popover);
    }
}

[ModuleInit]
public void peas_register_types(TypeModule module) {
    /* Boilerplate - all modules need this */
    var objmodule = module as Peas.ObjectModule;
    objmodule.register_extension_type(typeof(Budgie.Plugin), typeof(Plugin));
}
