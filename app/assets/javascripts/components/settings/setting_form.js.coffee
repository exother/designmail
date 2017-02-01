@SettingForm = React.createClass
  getInitialState: ->
    host: ''
    user: ''
    password: ''
    name: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.host && @state.user && @state.password

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/settings', { setting: @state }, (data) =>
      @props.handleNewSetting data
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
          placeholder: 'Host'
          name: 'host'
          value: @state.host
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'User'
          name: 'user'
          value: @state.user
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Password'
          name: 'password'
          value: @state.password
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        'Add setting'
