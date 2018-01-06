import Widget from require "lapis.html"
import Navigation from require "widgets"
import pretty_date from require "utility.date"
import is_admin from require "utility.auth"

class PostIndex extends Widget
  content: =>
    @previous_label = "Most recent"
    @next_label = "Oldest"

    widget Navigation

    for post in *@posts
      div class: "container has-text-centered", ->
        h2 class: "subtitle", post.title
        h3 class: "subtitle is-6", pretty_date post.published_at
      div class: "content", ->
        raw post.preview_html
        hr!
        a href: @url_for("posts_view", slug: post.slug), "Read More"
        text " ("
        span class: "disqus-comment-count", "data-disqus-identifier": "https://guard13007.com#{@url_for "posts_view", slug: post.slug}"
        text ")"
      if is_admin @
        div class: "container has-text-centered", ->
          a class: "button", href: @url_for("posts_edit", id: post.id), "Edit Post"

    widget Navigation
