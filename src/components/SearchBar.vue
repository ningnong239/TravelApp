<template>
  <div class="max-w-md mx-auto mb-6 flex gap-x-2">
    <input
      v-model="keyword"
      @keyup.enter="search"
      type="text"
      placeholder="ค้นหาทริป"
      class="flex-grow px-4 py-2 bg-gray-100 rounded-lg text-black focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
    />
    <button
      @click="search"
      class="px-4 py-2 bg-green-100 text-black rounded-lg hover:bg-green-100"
    >
      Search
    </button>
  </div>
</template>

<script lang="ts" setup>
import { ref } from "vue";
import { api } from "../api.ts";
import type { Trip } from "../types/trip.ts";

const keyword = ref("");

const emit = defineEmits<{
  (e: "updateResults", trips: any[]): void;
}>();

const search = async () => {
  try {
    const response = await api.get<Trip[]>("/api/trips", {
      params: { query: keyword.value || undefined },
    });
    emit("updateResults", response.data);
  } catch (error) {
    console.error("Search failed:", error);
  }
};
</script>
