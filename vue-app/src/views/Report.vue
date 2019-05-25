<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-secondary bg-secondary d-flex justify-content-between p-3">
      <router-link to="/status" class="text-secondary nav-link disabled display-4 font-weight-bold d-none d-md-block">Report</router-link>
      <router-link to="/status" class="text-body nav-link display-4 font-weight-bold">Status<i class="fas fa-angle-right ml-3 mt-1"></i></router-link>
    </nav>
    <report-view></report-view>
  </div>
</template>

<script>
// @ is an alias to /src
import ReportView from '@/components/ReportView.vue'

export default {
  name: 'report',
  components: {
    ReportView
  }
}
</script>
