@Email = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/emails/#{ @props.email.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteEmail @props.email

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.email.email
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'