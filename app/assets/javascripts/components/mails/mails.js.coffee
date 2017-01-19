@Mails = React.createClass
  getInitialState: ->
    mails: @props.data

  getDefaultProps: ->
    mails: []

  addMail: (mail) ->
    mails = @state.mails.slice()
    mails.push mail
    @setState mails: mails

  deleteMail: (mail) ->
    mails = @state.mails.slice()
    index = mails.indexOf mail
    mails.splice index, 1
    @replaceState mails: mails

  render: ->
    React.DOM.div
      className: 'mails'
      React.DOM.h2
        className: 'title'
        'Mails'
      React.createElement MailForm, handleNewMail: @addMail
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Mail'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for mail in @state.mails
            React.createElement Mail, key: mail.id, mail: mail, handleDeleteMail: @deleteMail
