class <%= js_app_name %>.<%= plural_name.camelize %>Controller extends Batman.Controller
  routingKey: '<%= plural_name.downcase %>'
<% actions = ['index', 'new', 'show', 'create', 'edit', 'update', 'destroy'] if actions.nil? %>
<% actions.each do |action| -%>
  <%- if action == 'index' %>
  index: ->
    <%= js_app_name %>.<%= singular_name.camelize %>.load (err,results) =>
      @set '<%= plural_name.downcase %>', new Batman.Set(results...)
  <%- elsif action == 'new' %>
  new: (params) ->
    @set '<%= singular_name.downcase %>', new <%= js_app_name %>.<%= singular_name.camelize %>()
    throw err if err
  <% elsif action == 'show' -%>
  show: (params) ->
    @set '<%= singular_name.downcase %>', <%= js_app_name %>.<%= singular_name.camelize %>.find parseInt(params.id, 10), (err) ->
      throw err if err
  <% elsif action == 'create' -%>
  create: (params) ->
    @get('<%= singular_name.downcase %>').save (err) =>
      if err
        throw err 
      else
        <%= js_app_name %>.set "flash.success", "<%= singular_name.camelize %> created successfully!"
        @redirect <%= js_app_name %>.get('routes.<%= singular_name.downcase %>.path')
  <% elsif action == 'edit' -%>
  edit: (params) ->
    @set '<%= singular_name.downcase %>', <%= js_app_name %>.<%= plural_name.camelize %>.find parseInt(params.id, 10), (err) ->
      throw err if err
  <% elsif action == 'update' -%>
  update: (params) ->
    @get('<%= singular_name.downcase %>').save (err) =>
      if err
        throw err 
      else
        <%= js_app_name %>.set "flash.success", "<%= singular_name.camelize %> updated successfully!"
        @redirect '/<%= plural_name.downcase %>'
  <% elsif action == 'destroy' -%>
  destroy: (params) ->
    <%= js_app_name %>.<%= plural_name.camelize %>.destroy
      
  <% end -%>    
<% end -%>
