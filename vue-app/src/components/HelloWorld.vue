<template>
<div>
  <h2 class="pt-5 text-light text-center pb-3">Reported that you have arrived</h2>
  <ul class="list-group w-50 mx-auto mt-1" v-for="worker in notarrived" :key="worker.id">
    <li class="list-group-item d-flex  justify-content-between" @click="getInfo(worker)"><h5 class="mt-2">{{ worker.name }}</h5><button class="btn btn-danger p-0 rounded-pill pl-3 pr-3"><i class="fas fa-times fa-2x"></i></button></li>
  </ul>
   <transition name="fade">
  <div class="w-50 mx-auto" v-show="showInput">
    <input type="password" class="form-control mt-3" placeholder="Password" v-model="input">
    <button type="button" class="btn btn-primary btn-lg btn-block mt-2"  @click="handleSubmit">Report</button>
  </div>
   </transition>
</div>
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
export default {
  data () {
    return {
      workers: [],
      input: '',
      password: '',
      match: '',
      worker: {
        id: 1,
        arrived: false,
        sha: '',
        name: ''
      },
      showInput: false
    }
  },
  mounted () {
    axios
      .get('http://localhost:3000/coworkers')
      .then(response => (this.workers = response.data))
  },
  methods: {
    getInfo (e) {
      this.worker.sha = e.sha
      this.worker.id = e.id
      this.worker.name = e.name
      console.log(e) // Sätt in data
      this.showInput = !this.showInput
    },
    matchPassword (password) {
      if (password === this.worker.sha) {
        let data = this.worker.arrived = !this.worker.arrived
        this.workers.map(coworker => {
          async function sendData (id) {
            await axios.put('http://localhost:3000/coworkers/' + id, { arrived: data })
          }
          if (coworker.id === this.worker.id) {
            sendData(this.worker.id)
            Vue.set(coworker, 'arrived', true)
          }
        })
      } else {
        alert('Wrong password')
      }
    },
    // matchPassword (password) {
    //   if (password === this.worker.sha) {
    //     this.worker.arrived = !this.worker.arrived
    //     //  const workerId = this.workers.find(coworker => coworker.id === this.worker.id)
    //     //  this.workers[workerId] = this.worker
    //     // console.log(this.workers[workerId])
    //     const newWorkers = this.workers.map(coworker => {
    //       if (coworker.id === this.worker.id) {
    //         return ({ ...coworker, arrived: !coworker.arrived })
    //       } else {
    //         return ({ ...coworker })
    //       }
    //     })
    //     this.workers = newWorkers

    //     // return this.workers.filter(coworker => coworker.id === this.worker.id)
    //   }
    // },
    handleSubmit () {
      this.password = this.input
      this.matchPassword(this.password)
      return (this.input = '')
    }
  },
  computed: {
    notarrived () {
      return this.workers.filter(coworker => coworker.arrived === false)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
  .fade-enter-active, .fade-leave-active {
    transition: opacity 0.5s;
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
    opacity: 0;
  }
</style>
