<template>
  <div class="my-app">
    <h1>Vuechat</h1>
  </div>
</template>

<template>
  <div class="my-app">
    <h1>Vuechat</h1>
    <ul v-for="message in messages">
      <li>{{message}}</li>
    </ul>
  </div>
</template>

<script>

export default {
}
</script>

<script>
export default {
  data() {
    return {
      channel: null, 	
      messages: []
    }
  },
  render(createElement) {
    return createElement(MyApp, {})
  }
}
</script>

<style lang="sass">
.my-app {
  margin-left: auto;
  margin-right: auto;
  width: 800px;
  h1 {
    text-align: left;
  }
}
</style>

