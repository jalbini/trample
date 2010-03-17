Trample.configure do
  concurrency 1
  iterations  1

  #Engagement Complete 40req/sec
  #AppEngagementsController.create_sponsorship_activity_app_engagement_bypass_auth
  #
 # var postData:String = 'app_engagement_interaction[app_activity_id]=30' + '&';
  #postData += 'app_engagement_interaction[name]=video_played';
  $counter = rand(999)
  post "http://staging.archetypemedia.com/s/light_engagements" do  
    #increment network_user_id on each hit, recommend random number on each.
    {:light_engagement => {:network_user_id => networkID, :app_activity_id => 88, :time_spent_on_engagement => 5000, :partner_config_hash => "d78d33bf67f0b1e5366fb9e63acbd085e3d8cbda", :internal_referring_source => "aw.d78d33bf67f0b1e5366fb9e63acbd085e3d8cbda"}}
  end
end

#Engagemnt Complete
def networkID
  $counter += rand (99)
  return $counter
end