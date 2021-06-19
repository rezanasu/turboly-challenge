import Vue from 'vue'
import Vuex from 'vuex'
import axios from "../API/axios.js"
import router from '../router/index.js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin: false,
    tasks: []
  },
  mutations: {
    setLogin (state, payload) {
      state.isLogin = payload
    },
    setTasks (state, payload) {
      state.tasks = payload
    },
    addTask (state, payload) {
      state.tasks.push(payload)
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
    },
    fetchTasks(state) {
      axios({
        method: "GET",
        url: "/tasks",
        headers: {Authorization: localStorage.getItem('access_token')}
      })
      .then(response => {
        const result = response.data.tasks;
        state.commit('setTasks', result)
        console.log(result);
      })
      .catch(err => {
        console.log(err);
      })
    },
    addTask(state, payload) {
      console.log(state)
      console.log(payload, "<<<<<<<<< PAYLOAD")
      axios({
        method: "POST",
        url: "/tasks",
        headers: {Authorization: localStorage.getItem('access_token')},
        data: {
          title: payload.title,
          description: payload.description,
          priority: payload.priority,
          status: payload.status,
          dueDate: payload.dueDate
        }
      })
      .then(response => {
        const newTask = response.data.task;
        state.commit('addTask', newTask);
        router.push('/');
      })
      .catch(err => {
        console.log(err);
      })
    }
  },
  modules: {
  }
})
