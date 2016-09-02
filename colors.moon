lapis = require "lapis"

import respond_to from require "lapis.application"

Colors = require "models.Colors"

class extends lapis.Application
    @path: "/colors"
    @name: "colors_"

    [hex: "(:hex[a-fA-F%d])"]: =>
        @hex = hex\sub 1, 6 -- TODO check me
        render: "color", layout: "simple"

    -- id, code, name
    --[colors_add: "/colors/add/:hex[a-fA-F%d]"]: =>
    --    @params.hex
