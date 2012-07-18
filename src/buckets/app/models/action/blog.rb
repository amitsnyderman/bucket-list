require 'xmlrpc/client'

class XMLRPC::Client
  def set_debug
    @http.set_debug_output($stderr);
  end
end

class Action::Blog < Action
  # http://www.xmlrpc.com/metaWeblogApi
  # http://blog.marc-seeger.de/2008/02/26/using-metaweblog-xmlrpc-in-ruby
  
  def execute(item)
    return if metablog_endpoint.nil?
    
    client = XMLRPC::Client.new2(metablog_endpoint)
    client.set_debug
    
    content = {
      :title => item.bucket.code.humanize,
      :description => item.text,
      :category => [item.bucket.code]
    }
    client.call('metaWeblog.newPost', metablog_identifier, metablog_username, metablog_password, content, true)
  end
end
