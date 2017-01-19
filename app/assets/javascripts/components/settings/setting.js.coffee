@Setting = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/settings/#{ @props.setting.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteSetting @props.setting

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.setting.name
      React.DOM.td null, @props.setting.host
      React.DOM.td null, @props.setting.user
      React.DOM.td null, @props.setting.password
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'