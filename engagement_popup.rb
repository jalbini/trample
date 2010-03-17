Trample.configure do
  concurrency 1
  iterations  1
  #Engagmanet Popup 40req/sec
  #example:
  #http://staging.archetypemedia.com/s/profile/user_engagement_iframe/?max_engagements=1&aaid=94&sauid=319&irs=dashboard_activity_feed
  get "http://staging.archetypemedia.com/s/profile/user_engagement_iframe/?max_engagements=1&aaid=:aaid&sauid=:sauid&irs=dashboard_activity_feed" do
    {:aaid => aaid, :sauid => sauid}
  end
end

#for Engagement popup
def aaid
  #limit to actual aaid
  return rand(999)
end

def sauid
  #limit to actual sauid
  return rand(99999)
end