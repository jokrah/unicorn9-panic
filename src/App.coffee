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
      if @buttonText == "ACTIVATE"
        await @$http.post "https://api-proxy.hashstax.de/projects/christoph/contexts/Stax_1/storage",
          account: true
        ,
          headers:
            'Originator-Ref': @privateKey
        @buttonText = "DEACTIVATE"
      else
        await @$http.post "https://api-proxy.hashstax.de/projects/christoph/contexts/Stax_1/storage",
          account: false
        ,
          headers:
            'Originator-Ref': @privateKey
        @buttonText = "ACTIVATE"
      return

    statusUpdate: ->
      @loading = true
      try
        response = await @$http.get "https://api-proxy.hashstax.de/projects/christoph/contexts/Stax_1/storage",
          headers:
            'Originator-Ref': @privateKey
        data = response.body.pop()
        @buttonText = if data.body.account == true then "DEACTIVATE" else "ACTIVATE"
        delay 2000, => # cause of ux
          @loading = false
          @found = true
      catch
        @loading = false
      return
