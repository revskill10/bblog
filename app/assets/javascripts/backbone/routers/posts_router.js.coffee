class Blog.Routers.PostsRouter extends Backbone.Router

  initialize: (options) ->
    @posts = new Blog.Collections.PostsCollection()
    @posts.reset options.posts

  routes: 
    "index" : "index"
    "newPost" : "newPost"
    ":id" : "show"
    ":id/edit" : "edit"

  index: ->
    @view = new Blog.Views.PostsIndexView({collection: @posts})

  show: (id) ->
    post = @posts.get(id)
    @view = new Blog.Views.PostsShowView({model: post})

  newPost: ->
    @view = new Blog.Views.PostsNewView({collection: @posts})

  edit: (id) ->
    post = @posts.get(id)
    @view = new Blog.Views.PostsEditView({model: post})