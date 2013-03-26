#Begin Locations present

Then /^I should be able to get details for each location$/ do
  expected_titles = %w[Westvleteren Chimay Westmalle Rochefort Orval Achel]

  expected_titles.each do |title|
    title_idx = query("view:'MKPinAnnotationView'", :annotation, :title).index(title)
    raise "Unable to see #{title}" if title_idx.nil?


    touch("view:'MKPinAnnotationView' index:#{title_idx}")
    wait_for_elements_exist(["button marked:'More info'"])
    screenshot_embed(:label => title)

    touch("view:'MKMapView'")#remove dialog
    sleep(0.5)
  end
end

#End


Given /^I'm on the map$/ do
  wait_for_elements_exist(["view:'MKPinAnnotationView'"])
  pinch(:out)
  screenshot_embed(:label => "Map")
end

When /^I go to Chimay$/ do
  touch("view marked:'Chimay'")
  wait_for_elements_exist(["button marked:'More info'"])
  touch("button marked:'More info'")

  wait_for_elements_exist(["navigationItemButtonView marked:'Back'"])
  wait_for_none_animating
end

Then /^I should see detailed information about Chimay$/ do
  wait_for_elements_exist(["webView css:'input.search'"])

  scroll("webView", :down)

  wait_for_elements_exist(["view marked:'Trappist brewery'",
                           "view marked:'Chimay Brewery'"])

  screenshot_embed(:label => "Details for Chimay")
end
