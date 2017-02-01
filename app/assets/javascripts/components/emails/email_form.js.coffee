@EmailForm = React.createClass
  getInitialState: ->
    email: ''
    addMode: 'single'
    file: null

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.email

  multipleSelect: ->
    @state.addMode == 'multiple'

  sendValue: ->
    if @multipleSelect()
      return 'Upload file'
    else
      return 'Add email'

  handleSubmit: (e) ->
    e.preventDefault()
    if @multipleSelect()
      data = new FormData
      data.append('file', $('#fileSelector').get(0).files[0])
      $.ajax '', {
        contentType: false
        data: data
        processData: false
        type: 'POST'
        success: (data) =>
          for email in data
            @props.handleNewEmail email
          @setState @getInitialState()
      }

    else
      $.post '', { email: @state }, (data) =>
        @props.handleNewEmail data
        @setState @getInitialState()
      , 'JSON'

  render: ->
    React.DOM.form
      id: 'emailForm'
      className: 'form'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.select
          className: 'form-control'
          name: 'addMode'
          value: @state.addMode
          onChange: @handleChange
          React.DOM.option
            value: 'single'
            'Single'
          React.DOM.option
            value: 'multiple'
            'Multiple'
      React.DOM.div
        className: 'form-group'
        hidden: @multipleSelect()
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Email'
          name: 'email'
          value: @state.email
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        hidden: !@multipleSelect()
        React.DOM.div
          className: 'input-group'
          React.DOM.label
            className: 'input-group-btn'
            React.DOM.span
              className: 'btn btn-primary'
              React.DOM.text
                'Select csv file'
              React.DOM.input
                id: 'fileSelector'
                className: 'file'
                type: 'file'
                style: { display: 'none' }
          React.DOM.input
            className: 'form-control selectedFileName'
            readOnly: true
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
#        disabled: !@valid()
        @sendValue()
