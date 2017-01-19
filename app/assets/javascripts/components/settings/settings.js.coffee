@Settings = React.createClass
  getInitialState: ->
    settings: @props.data

  getDefaultProps: ->
    settings: []

  addSetting: (setting) ->
    settings = @state.settings.slice()
    settings.push setting
    @setState settings: settings

  deleteSetting: (setting) ->
    settings = @state.settings.slice()
    index = settings.indexOf setting
    settings.splice index, 1
    @replaceState settings: settings

  render: ->
    React.DOM.div
      className: 'settings'
      React.DOM.h2
        className: 'title'
        'Settings'
      React.createElement SettingForm, handleNewSetting: @addSetting
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Host'
            React.DOM.th null, 'User'
            React.DOM.th null, 'Password'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for setting in @state.settings
            React.createElement Setting, key: setting.id, setting: setting, handleDeleteSetting: @deleteSetting
