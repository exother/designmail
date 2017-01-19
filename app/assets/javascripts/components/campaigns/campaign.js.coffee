@Campaign = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/campaigns/#{ @props.campaign.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteCampaign @props.campaign

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.campaign.name
      React.DOM.td null, @props.campaign.content
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'Delete'