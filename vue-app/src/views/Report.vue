<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-secondary bg-secondary">
      <router-link to="/status" class="text-body nav-link mx-auto display-4 font-weight-bold">Report</router-link>
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
