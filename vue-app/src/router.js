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
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
    }
  ]
})
