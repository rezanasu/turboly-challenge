import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import 'bootstrap/dist/css/bootstrap.css'
import moment from 'moment'

Vue.config.productionTip = false
Vue.prototype.moment = moment

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
