import Vue from 'vue'
import Vuex from 'vuex'
import axios from "../API/axios.js"
import router from '../router/index.js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin: false
  },
  mutations: {
    setLogin (state, payload) {
      state.isLogin = payload
    }
  },
  actions: {
    login (state, payload) {
      axios({
        method: "POST",
        url: "/login",
        data: {
          email: payload.email,
          password: payload.password
        }
      })
      .then(response => {
        const generatedToken = response.data.token
        localStorage.setItem("access_token", generatedToken)
        state.commit('setLogin', true);
        router.push('/')
      })
      .catch(err => {
        console.log(err);
      })
    }
  },
  modules: {
  }
})
