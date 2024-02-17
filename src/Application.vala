/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2024 Kristof Houwen <khouwen@gmail.com>
 */
 
public class MyApp : Gtk.Application {
    public MyApp () {
        Object(
            application_id: "com.github.kristof-houwen",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    
    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow(this){
            default_height = 900,
            default_width = 600,
            title = _("Mastodon Live Feeder")
        };
        
        var btn_test = new Gtk.Button.with_label(_("Click me!")) {
            margin_top = 12,
            margin_bottom = 12,
            margin_start = 12,
            margin_end = 12
        };
        
        btn_test.clicked.connect(() => {
            btn_test.label = _("Hello World");
            btn_test.sensitive = false;
        });
        
        main_window.child = btn_test;
        main_window.present();
    }
    
    public static int main(string[] args) {
        return new MyApp().run(args);
    }
}
