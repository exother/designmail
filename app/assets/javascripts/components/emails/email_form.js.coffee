@EmailForm = React.createClass
  getInitialState: ->
    email: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.email

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { email: @state }, (data) =>
      @props.handleNewEmail data
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
          placeholder: 'Email'
          name: 'email'
          value: @state.email
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Add email'
