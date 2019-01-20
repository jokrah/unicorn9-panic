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
      try
        response = await @$http.get("url")
        data = response.body
      catch error
        # maybe error
      return
    statusUpdate: ->
      try
        @loading = true
        delay 3000, =>
          @found = true
          @loading = false
          console.log = 'test'
        response = await @$http.get("url")
        data = response.body
      catch error
      # maybe error
      return