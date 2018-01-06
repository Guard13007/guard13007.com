import Widget from require "lapis.html"
import Crafts, Users from require "models"
import Pagination from require "widgets"

tabs = {
  "All", "Reviewed", "Pending", "New", "Rejected"
}

class KSPCraftsIndex extends Widget
  content: =>
    -- TODO search widget here

    div class: "tabs is-centered", ->
      ul ->
        @params.tab = "all" unless @params.tab
        for tab in *tabs
          if @params.tab == tab\lower!
            li class: "is-active", -> a tab
          else
            li -> a href: @url_for("ksp_crafts_index", tab: tab\lower!), tab

    widget Pagination

    element "table", class: "table is-bordered is-striped is-narrow is-fullwidth", ->
      thead ->
        tr ->
          th "Craft"
          th "Creator"
          th "Status"
          th "Notes"
      tfoot ->
        tr ->
          th "Craft"
          th "Creator"
          th "Status"
          th "Notes"
      tbody ->
        the_date = os.date "*t", os.time!
        for craft in *@crafts
          tr ->
            td -> a href: @url_for("ksp_crafts_view", id: craft.id), craft.name
            name = craft.creator
            if the_date.month == 4 and the_date.day == 1
              name = "John"
            elseif craft.user_id != 0
              if user = Users\find id: craft.user_id
                name = user.name
            td name
            status = Crafts.statuses\to_name craft.status
            td class: status, status
            if Crafts.statuses.reviewed == craft.status
              td -> a href: "https://youtube.com/watch?v=#{craft.episode}", target: "_blank", "Watch on YouTube"
            else
              td craft.notes

    widget Pagination
