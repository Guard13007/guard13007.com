import Widget from require "lapis.html"
import Users, Crafts from require "models"
import KSPCraftsSearchWidget from require "widgets"

class KSPCraftsSearch extends Widget
  content: =>
    widget KSPCraftsSearchWidget

    if @crafts and #@crafts > 0
      link rel: "stylesheet", href: "/static/css/ksp.css"
      element "table", class: "table is-bordered is-striped is-narrow is-fullwidth", ->
        thead ->
          tr ->
            th "Craft"
            th "Creator"
            th "KSP version"
            th "Status"
            th "Notes"
        tfoot ->
          tr ->
            th "Craft"
            th "Creator"
            th "KSP version"
            th "Status"
            th "Notes"
        tbody ->
          for craft in *@crafts
            tr ->
              td craft.name
              local name = craft.creator
              if craft.user_id != 0
                if user = Users\find id: craft.user_id
                  name = user.name
              td name
              td craft.ksp_version
              local status = Crafts.statuses\to_name craft.status
              td class: status, status
              if Crafts.statuses.reviewed == craft.status
                td -> ah ref: "https://youtube.com/watch?v=#{craft.episode}", target: "_blank", "Watch on YouTube"
              else
                td craft.notes
    else
      p "Please enter a search term (and optionally a version of KSP)."
