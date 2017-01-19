@Mail = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/mails/#{ @props.mail.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteMail @props.mail

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.mail.mail
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'