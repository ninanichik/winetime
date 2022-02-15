When('GET request is sent to users') do
  @response = @connection_helper.get_users
end

Then('response with list of users should be provided') do
  expect(@response.body).to eq('')
end

Then('status code is {string}') do |status|
  expect(@response.status.to_s).to eq(status)
end

When('GET request is sent to wines') do
  @response = @connection_helper.get_wines
end

Then('response with list of wines should be provided') do
  expect(@response.body).to eq('')
end

When('GET request is sent to wine') do
  @response = @connection_helper.get_wine(2)
end

Then('response with one wine should be provided') do
  expect(@response.body).to eq('')
end

When('DELETE request is sent to wine') do
  @response.delete_wine(2)
end

Then('response should be empty') do
  expect(@response.body).to be_empty
end

Then('user should be redirected to wines list') do
  expect(@response.body).to_not include('')
end

When(/^POST request is sent to add new wine with (.*?), (.*?), (.*?), (.*?)$/) do |name, wine_variety, produced_year, produced_place|
  @response = @connection_helper.add_new_wine(name, wine_variety, produced_year, produced_place)
end

Then('response with new wine should be provided') do
  expect(@response.body).to eq('')
end

When(/^PUT request is sent to add new wine by (.*?) with (.*?), (.*?), (.*?), (.*?)$/) do |id, name, wine_variety, produced_year, produced_place|
  @response = @connection_helper.update_wine(id, name, wine_variety, produced_year, produced_place)
end

Then('error message should be provided') do
  expect(@response.body).to eq('')
end

When('POST request is sent to add new wine with incorrect params') do
  pending # Write code here that turns the phrase above into concrete actions
end
