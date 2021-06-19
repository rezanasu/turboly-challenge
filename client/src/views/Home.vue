<template>
  <div class="container-fluid">
    <div class="d-flex justify-content-center p-3 mb-3">
      <button class="btn btn-success" @click="toAdd">ADD NEW TASK</button>
    </div>
    <div class="p-3 table-responsive">
      <table class="table table-striped table-hover">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Priority</th>
            <th scope="col">Status</th>
            <th scope="col">Due Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(task, index) in tasks" :key="index">
            <th scope="row">{{index+1}}</th>
            <td>{{task.title}}</td>
            <td>{{task.description}}</td>
            <td>{{task.priority}}</td>
            <td>{{task.status ? "completed" : "uncompleted"}}</td>
            <td>{{task.dueDate}}</td>
            <td><button @click="updateStatus(task.id, task.status)" class="btn btn-primary btn-sm">UPDATE STATUS</button> <button @click="handleEdit(task.id)" class="btn btn-secondary btn-sm">EDIT</button> <button @click="deleteTask(task.id)" class="btn btn-sm btn-danger">DELETE</button></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: "Home",
  methods: {
    toAdd () {
      this.$router.push("/add");
    },
    updateStatus (id, currentStatus) {
      let newStatus = !currentStatus;

      this.$store.dispatch('updateStatus', {
        id,
        status: newStatus
      })
    },
    deleteTask (id) {
      this.$store.dispatch('deleteTask', {
        id
      })
    },
    handleEdit (id) {
      this.$store.dispatch('findTaskById', {
        id
      })
    }
    
  },
  computed: {
    tasks() {
      return this.$store.state.tasks;
    },
  },
  created() {
    this.$store.dispatch("fetchTasks");
  },
};
</script>

<style>
</style>