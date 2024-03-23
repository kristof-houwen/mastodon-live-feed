public class MastodonParser : Object {
    
    public string mastodonApiUrl {get; set;}
    
    
    public (string mastodonInstance) {  //https://mastodon.social
        mastodonUrl = mastodonInstance + "/api/v1/timelines/public?limit=1";
    }
    
    public MastodonMsgContent getMessage(){
        var session = new Soup.Session();
        var msg = new Soup.Message("GET", uri);
        session.send_message(msg);
        var mstcontent = new MastodonMsgContent();
       try{
            var parser = new Json.Parser();
            parser.load_from_data((string) msg.response_body.flatten().data, -1);
            var data = parser.get_root().dup_array().get_elements();
            
            data.foreach((el) => {
                var obj = el.get_object();
                var members = obj.get_members();
                members.foreach((el) => {
                    
                    var d = obj.get_member(el);
                    
                    
                    if (el == "url")
                    {
                        mstcontent.uri = (string)d.get_value();
                    }
                    
                    if (el == "content")
                    {
                        mstcontent.content = (string)d.get_value();
                    }
                    

                });
                
                
            });
            
     
        } catch (Error e){
            error("%s", e.message);
        }
        return mstcontent;
    }
    
    
}
