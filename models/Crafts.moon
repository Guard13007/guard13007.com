import Model, enum from require "lapis.db.model"

class Crafts extends Model
    @timestamp: true

    @statuses: enum {
        unseen: 0
        pending: 1
        reviewed: 2
        rejected: 3
        delayed: 4
    }

    @constraints: {
        craft_name: (value) =>
            unless value
                return "Craft must have a name!"
        download_link: (value) =>
            unless value
                return "You must enter a download link!"
            if Crafts\find download_link: value
                return "That craft has already been submitted!"
            --TODO validate URL here!

        --description: (value) =>
        --    unless value
        --        return "You must enter a description of the craft!"
        --creator_name: (value) =>
        --    unless value
        --        return "You must enter a name for the crafts' creator."
        --ksp_version: (value) =>
        --    unless value
        --        return "You must tell me what version of KSP this craft was made in."
    }
