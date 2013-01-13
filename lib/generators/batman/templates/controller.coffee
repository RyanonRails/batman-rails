class <%= js_app_name %>.<%= plural_name.camelize %>Controller extends Batman.Controller
<% actions.each do |action| -%>
  <% if action == 'index' %>
  <%= js_app_name %>.<%= singular_name.camelize %>.load (err,results) =>
    @set '<%= plural_name.camelize %>', new Batman.Set(results...)
  <% else %>
    <%= action %>: (params) ->

  <% end %>


    
<% end -%>
