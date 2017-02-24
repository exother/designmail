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
      React.DOM.td null, @props.campaign.subject
      React.DOM.td null, "#{@props.campaign.from_name} (#{@props.campaign.from_email})"
      React.DOM.td null, @props.campaign.content
      React.DOM.td null, "#{@props.emails_processed.processed}/#{@props.emails_processed.all}"
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'