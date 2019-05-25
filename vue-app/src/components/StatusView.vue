<template>
  <div class="container-fluid pl-0 pr-0">
    <header>
    <h1 class="pt-5 text-dark text-left font-weight-bold">{{ message }}</h1>
    </header>
    <div v-show="loading">
      <h1>Loading...</h1>
    </div>
    <main class="mt-4">
    <ul class="list-group list-group-flush w-100" v-for="worker in data" :key="worker.id">
        <li class="list-group-item lead"><span class="font-name">{{ worker.name }}</span>
          <i :class="[ worker.arrived ? 'fa-2x text-secondary d-flex justify-content-end fas fa-check' : 'fa-2x text-secondary d-flex justify-content-end fas fa-times' ]"></i>
        </li>
    </ul>
    </main>
    <!-- <ul
        class="list-group w-50 mx-auto"
        v-for="arrive in data"
        :key="arrive.id"
      >
        <li class="list-group-item border border-3-green mt-2">
          <span class="lead font-weight-bold">{{ arrive.name }}</span
          ><i class="fas fa-check  ml-2  fa-2x text-success"></i>
        </li>
      </ul> -->
    <!-- <ul
        class="list-group w-50 mx-auto"
        v-for="arrive in notarrived"
        :key="arrive.id"
      >
        <li class="list-group-item border border-3-red mt-2">
          <span class="lead font-weight-bold">{{ arrive.name }}</span
          ><i class="fas fa-check  ml-2  fa-2x text-danger"></i>
        </li>
      </ul> -->

  </div>
</template>

<script>
import axios from 'axios'
export default {
  props: {
    message: {
      type: String,
      required: true
    }
  },
  data () {
    return {
      loading: true,
      data: []
    }
  },
  mounted () {
    axios
      .get('http://localhost:3000/coworkers', { crossdomain: true })
      .then(response => {
        this.data = response.data
        this.loading = false
      })
  }
  // computed: {
  //   arrived () {
  //     return this.data.filter(coworker => coworker.arrived === true)
  //   },
  //   notarrived () {
  //     return this.data.filter(coworker => coworker.arrived === false)
  //   }
  // }
}
// fa-2x text-secondary d-flex justify-content-end
// fas fa-times fas fa-check
</script>

<style>
    .border-3-red {
      border: 3px solid #dc3545 !important;
    }
    .border-3-green {
      border: 3px solid #28a745 !important;
    }
    .font-name {
      font-size: 2.5rem;
      color: #000;
      font-weight: 400;
    }
</style>
