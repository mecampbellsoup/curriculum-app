def require_subdomain
  org = FactoryGirl.create(:organization)
  @subdomain = org.subdomain
  @request.host = "#{org.subdomain}.test.host"
end