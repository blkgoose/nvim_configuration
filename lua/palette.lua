local black = "#000000"
local blue = "#6dcefd"
local cyan = "#57c1d9"
local dark_grey = "#555555"
local dark_orange = "#ffaa00"
local dark_purple = "#9985d1"
local default = "none"
local green = "#007010"
local grey = "#707070"
local light_grey = "#999999"
local light_pink = "#e6bac1"
local light_purple = "#bdceed"
local off_white = "#cccccc"
local orange = "#ea6634"
local pink = "#e68ac1"
local purple = "#b4a4de"
local red = "#e83f80"
local sun = "#ffb65e"
local teal = "#00aaaa"
local undefined = "#ff0000"
local vibrant_green = "#b2c481"
local white = "#eeeeee"
local yellow = "#f7d98d"

-- TODO: remove all the undefined markers

local palette = {
    directory = blue,
    fg = off_white,
    diff = {
        add = green,
        remove = red,
        text = dark_orange,
        change = orange,
    },
    accent = cyan,
    search_result = { fg = black, bg = yellow, telescope = blue },
    match = undefined,
    dimmed = {
        inactive = light_grey,
        subtle = light_grey,
    },
    bg = {
        base = default,
        alt = dark_grey,
        selected = dark_grey,
    },
    border = light_grey,
    syntax = {
        tag = undefined,
        statement = cyan,
        ["function"] = blue,
        variable = vibrant_green,
        include = blue,
        keyword = yellow,
        struct = blue,
        string = pink,
        identifier = purple,
        field = blue,
        parameter = undefined,
        property = undefined,
        punctuation = white,
        constructor = undefined,
        operator = sun,
        preproc = purple,
        constant = dark_purple,
        todo = { fg = black, bg = orange },
        number = light_purple,
        comment = blue,
        type = teal,
        conditional = yellow,
    },
    built_in = {
        ["function"] = blue,
        type = undefined,
        variable = vibrant_green,
        keyword = yellow,
        constant = undefined,
    },
    diagnostic = {
        error = red,
        warn = orange,
        info = light_grey,
        hint = light_grey,
    },
    inc_search = { fg = black, bg = dark_orange },
    uri = pink,
    pum = {
        fg = white,
        bg = grey,
        sbar = light_grey,
        thumb = white,
        sel = {
            bg = white,
            fg = black,
        },
    },
    heading = {
        h1 = light_pink,
        h2 = light_pink,
    },
}

return palette
