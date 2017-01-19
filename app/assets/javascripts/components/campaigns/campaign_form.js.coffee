@CampaignForm = React.createClass
  getInitialState: ->
    name: ''
    content: ''
    setting_id: null

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.name && @state.content && @state.setting_id

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { campaign: @state }, (data) =>
      @props.handleNewCampaign data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.textarea
          className: 'form-control'
          placeholder: 'Content'
          name: 'content'
          value: @state.content
          onChange: @handleChange
      React.DOM.select
        className: 'form-group'
        name: 'setting_id'
        value: @state.setting_id
        onChange: @handleChange
        React.DOM.option
          disabled: true
          selected: true
          'Select setting'
        for setting in @props.settings
          React.DOM.option
            value: setting.id
            setting.name
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Add campaign'
