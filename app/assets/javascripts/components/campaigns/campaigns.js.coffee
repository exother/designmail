@Campaigns = React.createClass
  getInitialState: ->
    campaigns: @props.data

  getDefaultProps: ->
    campaigns: []

  addCampaign: (campaign) ->
    campaigns = @state.campaigns.slice()
    campaigns.push campaign
    @setState campaigns: campaigns

  deleteCampaign: (campaign) ->
    campaigns = @state.campaigns.slice()
    index = campaigns.indexOf campaign
    campaigns.splice index, 1
    @replaceState campaigns: campaigns

  render: ->
    React.DOM.div
      className: 'campaigns'
      React.createElement CampaignForm, settings: @props.settings, handleNewCampaign: @addCampaign
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Subject'
            React.DOM.th null, 'From'
            React.DOM.th null, 'Content'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for campaign in @state.campaigns
            React.createElement Campaign, key: campaign.id, campaign: campaign, handleDeleteCampaign: @deleteCampaign
