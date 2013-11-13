ScribeAttribution = require('../modules/attribution')
ScribeLinkTooltip = require('../modules/link-tooltip')
ScribeMultiCursor = require('../modules/multi-cursor')
ScribeToolbar     = require('../modules/toolbar')


class ScribeDefaultTheme
  @stylesheets: {}

  constructor: (@editor) ->

  addModule: (name, options) ->
    switch name
      when 'attribution'  then return new ScribeAttribution(@editor, options)
      when 'link-tooltip' then return new ScribeLinkTooltip(@editor, options)
      when 'multi-cursor' then return new ScribeMultiCursor(@editor, options)
      when 'toolbar'      then return new ScribeToolbar(@editor, options)
      else return null

  addStyleSheet: (url) ->
    return if ScribeDefaultTheme.stylesheets[url]
    sheet = document.createElement('link')
    sheet.type = 'text/css'
    sheet.rel = 'stylesheet'
    sheet.href = url
    document.querySelector('head').appendChild(sheet)
    ScribeDefaultTheme.stylesheets[url] = true
  

module.exports = ScribeDefaultTheme