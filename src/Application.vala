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
        
        var bkg_grid = new Gtk.Grid(){
            column_spacing = 6,
            row_spacing = 6
        };
        
        var lbl_title = new Gtk.Label(_("title"));
        var lbl_tag = new Gtk.Label(_("#Tag(s): "));
        var txt_tag = new Gtk.Entry();
        var lbl_feed = new Gtk.Label("FEED comes HERE");
        var btn_refresh = new Gtk.Button.from_icon_name("view-refresh");
        
        bkg_grid.attach(lbl_title, 1,1, 4, 1);
        bkg_grid.attach(lbl_tag, 1, 2, 1, 1);
        bkg_grid.attach_next_to (lbl_tag, txt_tag, Gtk.PositionType.RIGHT, 2, 1);
        bkg_grid.attach(lbl_feed, 1,3,4, 2);
        bkg_grid.attach(btn_refresh, 5, 5,1, 1);
        
        
        main_window.child = bkg_grid;
        main_window.present();
    }
    
    public static int main(string[] args) {
        return new MyApp().run(args);
    }
}
