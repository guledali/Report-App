<template>
<div>
  <header>
    <h1 class="pt-5 text-dark text-left font-weight-bold">Report your arrival</h1>
    </header>
    <div v-show="loading">
      <h1>Loading...</h1>
    </div>
    <main class="mt-5">
  <ul class="list-group list-group-flush w-100" v-for="worker in notarrived" :key="worker.id">
    <li class="list-group-item lead font-weight-bold" @click="getInfo(worker)"><span class="mt-2 font-name">{{ worker.name }}</span><button :aria-label="'Report button for ' + worker.name" class="btn btn-secondary float-right"><i class="fa-2x text-light fas fa-times p-2"></i></button></li>
  </ul>
   <transition name="fade">
  <div class="container-fluid" v-show="showInput">
    <input type="password" class="form-control mt-5 pl-3 py-5 border-0" placeholder="Password" v-model="input">
    <button type="button" class="btn white btn-lg btn-block mt-5 p-4"  @click="handleSubmit"><span class="display-4 font-weight-normal text-primary">Report</span></button>
  </div>
   </transition>

    </main>
</div>
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
export default {
  data () {
    return {
      loading: true,
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
      .then(response => {
        this.workers = response.data
        this.loading = false
      })
  },
  methods: {
    getInfo (e) {
      this.icon = true
      this.worker.sha = e.sha
      this.worker.id = e.id
      this.worker.name = e.name
      //  console.log(e) // Sätt in data
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
<style scoped>
  .fade-enter-active, .fade-leave-active {
    transition: opacity 0.5s;
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
    opacity: 0;
  }
  ::placeholder {
    font-size: 3rem;
  }
  .white {
    background-color: #fff;
    border-color: #fff;
  }
  [placeholder]:focus::-webkit-input-placeholder {
  opacity: 0;
}
[placeholder]:focus::-moz-placeholder {
  opacity: 0;
}
[placeholder]:focus::-ms-input-placeholder  {
  opacity: 0;
}
input[type="password"] {
   font-size:3rem !important;
}

.font-name {
  font-size: 2.5rem;
  color: #000;
  font-weight: 400;
}
</style>
