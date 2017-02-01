@CampaignForm = React.createClass
  getInitialState: ->
    name: ''
    content: ''
    subject: ''
    from_name: ''
    from_email: ''
    setting_id: null

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.name && @state.content && @state.setting_id

  handleSubmit: (e) ->
    e.preventDefault()
    @state.content = $('#contentInput').val()
    console.log @state.content
    console.log $('#contentInput').val()
    $.post '', { campaign: @state }, (data) =>
      @props.handleNewCampaign data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form'
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
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Subject'
          name: 'subject'
          value: @state.subject
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'From (name)'
          name: 'from_name'
          value: @state.from_name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'From (email)'
          name: 'from_email'
          value: @state.from_email
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.textarea
          id: 'froala'
          className: 'form-control'
          placeholder: 'Content'
        React.DOM.input
          id: 'contentInput'
          type: 'hidden'
          name: 'content'
          value: @state.content
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.select
          className: 'form-control'
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
        className: 'btn btn-primary pull-right'
        'Add campaign'
      React.DOM.div
        className: 'clearfix'
