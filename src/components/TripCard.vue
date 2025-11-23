<template>
  <div
    class="max-w-5xl mx-auto my-4 bg-white rounded-lg shadow-md overflow-hidden flex gap-4 hover:shadow-lg transition-shadow w-full relative"
  >
    <!-- Main Image on the Left -->
    <div class="w-80 h-64 flex-shrink-0 overflow-hidden rounded-lg">
      <img
        :src="trip.photos[0]"
        :alt="trip.title"
        class="w-full h-full object-cover"
      />
    </div>

    <!-- Content on the Right -->
    <div class="p-6 flex flex-col flex-grow relative">
      <!-- Title -->
      <h3 class="text-2xl font-bold mb-2 text-black">{{ trip.title }}</h3>

      <!-- Description -->
      <p class="text-gray-700 text-sm mb-3 text-left leading-relaxed">
        {{ truncateText(trip.description, 120) }}
      </p>

      <!-- Read More Link -->
      <router-link
        :to="`/trips/${trip.id}`"
        class="text-blue-600 underline mb-3 inline-block text-sm text-left"
        style="z-index:10"
      >
        อ่านต่อ
      </router-link>

      <!-- Tags/Categories -->
      <div class="mb-4 flex flex-wrap gap-2">
        <span
          v-for="tag in trip.tags"
          :key="tag"
          class="text-blue-600 underline text-sm"
        >
          {{ tag }}
        </span>
      </div>

      <!-- Thumbnail Images -->
      <div class="flex gap-2 mt-auto">
        <div
          v-for="(photo, index) in displayThumbnails"
          :key="index"
          class="w-20 h-20 rounded overflow-hidden flex-shrink-0"
        >
          <img
            :src="photo"
            :alt="`${trip.title} - Photo ${index + 2}`"
            class="w-full h-full object-cover"
          />
        </div>
      </div>

      <!-- Link Icon in Bottom Right -->
      <div class="absolute bottom-4 right-4">
        <div class="w-8 h-8 bg-green-100 rounded-full flex items-center justify-center">
          <svg
            class="w-4 h-4 text-black"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"
            />
          </svg>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { computed } from "vue";
import type { PropType } from "vue";
import type { Trip } from "../types/trip";

const props = defineProps({
  trip: {
    type: Object as PropType<Trip>,
    required: true,
  },
});

function truncateText(text: string, length: number): string {
  if (!text) {
    return "";
  }
  return text.length > length ? text.slice(0, length) + "..." : text;
}

// Get up to 3 thumbnail images (excluding the first one which is the main image)
const displayThumbnails = computed(() => {
  return props.trip.photos.slice(1, 4);
});
</script>
