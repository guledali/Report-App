<template>
  <div>
    <h2 class="pt-5 text-light text-center">Morning status</h2>
    <ul
        class="list-group w-50 mx-auto"
        v-for="arrive in arrived"
        :key="arrive.id"
      >
        <li class="list-group-item border border-3-green mt-2">
          <span class="lead font-weight-bold">{{ arrive.name }}</span
          ><i class="fas fa-check  ml-2  fa-2x text-success"></i>
        </li>
      </ul>
    <ul
        class="list-group w-50 mx-auto"
        v-for="arrive in notarrived"
        :key="arrive.id"
      >
        <li class="list-group-item border border-3-red mt-2">
          <span class="lead font-weight-bold">{{ arrive.name }}</span
          ><i class="fas fa-check  ml-2  fa-2x text-danger"></i>
        </li>
      </ul>

  </div>
</template>

<script>
import axios from 'axios'
export default {
  data () {
    return {
      data: []
    }
  },
  mounted () {
    axios
      .get('http://localhost:3000/coworkers', { crossdomain: true })
      .then(response => (this.data = response.data))
  },
  computed: {
    arrived () {
      return this.data.filter(coworker => coworker.arrived === true)
    },
    notarrived () {
      return this.data.filter(coworker => coworker.arrived === false)
    }
  }
}
</script>

<style>
    .border-3-red {
      border: 3px solid #dc3545 !important;
    }
    .border-3-green {
      border: 3px solid #28a745 !important;
    }

</style>
