<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-primary bg-primary">
      <router-link to="/" class="text-light nav-link mx-auto display-4 font-weight-bold">Status</router-link>
    </nav>
    <StatusView />
  </div>
</template>

<script>
// @ is an alias to /src
import StatusView from '@/components/StatusView.vue'

export default {
  name: 'status',
  components: {
    StatusView
  }
}
</script>
