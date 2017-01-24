@Emails = React.createClass
  getInitialState: ->
    emails: @props.data

  getDefaultProps: ->
    emails: []

  addEmail: (email) ->
    emails = @state.emails.slice()
    emails.push email
    @setState emails: emails

  deleteEmail: (email) ->
    emails = @state.emails.slice()
    index = emails.indexOf email
    emails.splice index, 1
    @replaceState emails: emails

  render: ->
    React.DOM.div
      className: 'emails'
      React.createElement EmailForm, handleNewEmail: @addEmail
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Email'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for email in @state.emails
            React.createElement Email, key: email.id, email: email, handleDeleteEmail: @deleteEmail
