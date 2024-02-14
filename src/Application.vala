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
            title = "Mastodon Live Feeder"
        };
        
        
        
        main_window.present();
    }
    
    public static int main(string[] args) {
        return new MyApp().run(args);
    }
}
