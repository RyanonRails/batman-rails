class <%= js_app_name %>.<%= plural_name.camelize %>Controller extends Batman.Controller
  routingKey: '<%= plural_name.downcase %>'

<% actions.each do |action| -%>
  <% case action %>
  <% when 'index' %>
  index: ->
    <%= js_app_name %>.<%= singular_name.camelize %>.load (err,results) =>
      @set '<%= plural_name.downcase %>', new Batman.Set(results...)
  <% end %>    
<% end -%>
