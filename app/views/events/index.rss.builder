xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do 
  xml.channel do
    xml.title "Events"
    xml.description "Upcoming Events"
    xml.link formatted_events_url(:rss)
    
    for event in @events
      xml.item do 
        xml.title event.title
        xml.description event.body
        xml.pubDate event.created_at.to_s(:rfc822)
        xml.link formatted_event_url(event, :html)
      end
    end
  end
end
