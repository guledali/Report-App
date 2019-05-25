import Vue from 'vue'
import Router from 'vue-router'
import Report from './views/Report.vue'
import Status from './views/Status.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'report',
      component: Report
    },
    {
      path: '/status',
      name: 'status',
      component: Status
    }
  ]
})
