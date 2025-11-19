<script setup lang="ts">
import Navbar from "./components/Navbar.vue";
import { RouterView } from "vue-router";
</script>

<template>
  <div class="bg-white min-h-screen">
    <Navbar />
    <RouterView />
  </div>
</template>

<style scoped></style>
