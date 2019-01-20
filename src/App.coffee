import PacmanLoader from 'vue-spinner/src/PacmanLoader.vue'

delay = (ms, func) -> setTimeout func, ms

export default
  components: { PacmanLoader }
  data: ->
    privateKey: ""
    loading: false
    buttonText: "DEACTIVATE"
    found: false
  methods:
    changeStatus: ->
      if buttonText == "ACTIVATE"
        await @$http.post "https://api-proxy.hashstax.de/projects/christoph/contexts/Stax_1/storage",
          account: true
        ,
          'Originator-Ref': @privateKey
        buttonText = "DEACTIVATE"
      else
        await @$http.post "https://api-proxy.hashstax.de/projects/christoph/contexts/Stax_1/storage",
          account: false
        ,
        'Originator-Ref': @privateKey
        buttonText = "ACTIVATE"
      return

    statusUpdate: ->
      @loading = true
      try
        #delay 3000, =>
        #  @found = true
        #  @loading = false
        #  console.log = 'test'
        response = await @$http.get "https://jsonplaceholder.typicode.com/posts" + "wdsfwefdw"
        data = response.body.filter((el) -> el.userId == 10).pop()
        console.log data
        data =
          account: true
        @buttonText = if data.account == true then "DEACTIVATE" else "ACTIVATE"
      catch
        @loading = false
      return
