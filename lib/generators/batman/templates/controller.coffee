class <%= js_app_name %>.<%= plural_name.camelize %>Controller extends Batman.Controller
  routingKey: '<%= plural_name.downcase %>'

<% actions.each do |action| -%>
  <% case action %>
  <% when 'index' %>
    test
  <% end %>    
<% end -%>
