@MailForm = React.createClass
  getInitialState: ->
    mail: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.mail

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { mail: @state }, (data) =>
      @props.handleNewMail data
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
          placeholder: 'Mail'
          name: 'mail'
          value: @state.mail
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Add mail'
