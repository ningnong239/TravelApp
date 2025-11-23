<template>
  <section class="py-8">
    <div v-if="displayedTrips.length === 0" class="text-center text-gray-500 mt-12">
      <p>ยังไม่มีทริปที่เพิ่มเข้ามา</p>
    </div>
    
    <div v-else>
      <div class="flex flex-col gap-6">
        <TripCard v-for="trip in displayedTrips" :key="trip.id" :trip="trip" />
      </div>

      <div v-if="showLoadMore" class="text-center mt-6">
        <button
          @click="loadMore"
          class="bg-green-100 text-black px-4 py-2 rounded-lg hover:bg-green-100"
        >
          Load More
        </button>
      </div>
    </div>
  </section>
</template>

<script lang="ts" setup>
import { ref, computed, watch } from "vue";
import TripCard from "./TripCard.vue";
import type { Trip } from "../types/trip";

const props = defineProps<{
  trips?: Trip[];
}>();

const itemsPerPage = 6; // จำนวนการ์ดต่อ load
const currentPage = ref(1);

// ใช้ trips จาก props หรือใช้ array ว่าง
const trips = computed(() => props.trips || []);

// คำนวณ trips ที่จะแสดง
const displayedTrips = computed(() => {
  return trips.value.slice(0, currentPage.value * itemsPerPage);
});

// ปุ่ม Load More แสดงถ้ายังมี trips เหลือ
const showLoadMore = computed(() => {
  return displayedTrips.value.length < trips.value.length;
});

// ฟังก์ชันโหลด batch ต่อไป
const loadMore = () => {
  currentPage.value++;
};

// Reset currentPage เมื่อ trips เปลี่ยน
watch(() => props.trips, () => {
  currentPage.value = 1;
});
</script>
