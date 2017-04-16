if Meteor.isClient

  Template.hello.events
    'click button': ->
      MeteorCamera.getPicture {}, (e, r) ->
        if e
          alert(e.message)
        else
          date = new Date().new Date().toLocaleString()
          myPictures.insert {'time': date, 'pic': r}
          uploadCount = Session.get 'count' or 0
          uploadCount += 1
          Session.set 'count', uploadCount

  Template.hello.helpers
    pictures: ->
      myPictures.find {}, {sort: {time: 1}}
