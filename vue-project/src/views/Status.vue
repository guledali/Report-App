<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-primary bg-primary d-flex justify-content-between p-3">
      <router-link to="/" class="text-light nav-link display-4 font-weight-bold"><i class="fas fa-angle-left mr-2"></i>Report</router-link>
      <router-link to="/status" class="text-primary nav-link disabled display-4 font-weight-bold d-none d-md-block">Status</router-link>
    </nav>
    <status-view :message="message"></status-view>
  </div>
</template>

<script>
// @ is an alias to /src
import StatusView from '@/components/StatusView.vue'

export default {
  name: 'status',
  components: {
    StatusView
  },
  data () {
    return {
      message: 'Morning status'
    }
  }
}
</script>

<style>
</style>
