<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-secondary bg-secondary">
      <router-link to="/" class="text-body nav-link mx-auto display-4 font-weight-bold">Report</router-link>
    </nav>
    <HelloWorld />
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'home',
  components: {
    HelloWorld
  }
}
</script>
